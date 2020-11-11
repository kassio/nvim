# frozen_string_literal: true

require 'ripper'

class Namespace
  Token = Struct.new(:position, :type, :string, :state) do
    def line
      position[0].to_i
    end
  end

  class NamespaceSet
    NAMESPACE_TOKENS = %w[module class def loop do begin].freeze

    attr_reader :set

    def initialize
      @set = []
      @saving = false
    end

    def add(token)
      case token
      when method(:new_namespace?)
        @saving = true
        set << []
      when method(:namespace_ended?)
        @saving = false
      when method(:save_namespace?)
        set.last << token
      when method(:drop_namespace?)
        set.pop
      end
    end

    def format
      set
        .flatten
        .map(&:string)
        .join('::')
    end

    private

    def new_namespace?(token)
      NAMESPACE_TOKENS.include?(token.string)
    end

    def namespace_ended?(token)
      token.type == :on_nl || (token.type == :on_op && token.string == '<')
    end

    def save_namespace?(token)
      token.type == :on_const && @saving
    end

    def drop_namespace?(token)
      token.type == :on_kw && token.string == 'end'
    end
  end

  def initialize(file)
    @path, self.stop_line, = file.to_s.split(':')
  end

  def fetch
    @path
      .then { |path| File.read(path) }
      .then { |file| Ripper.lex(file) }
      .then { |tokens| parse(tokens) }
      .format
  end

  private

  attr_reader :stop_line

  def stop_line=(value)
    stop_line = value.to_i
    @stop_line = stop_line.zero? ? 1 : stop_line
  end

  def parse(tokens)
    set = NamespaceSet.new

    tokens.each do |token|
      token = Token.new(*token)
      break if token.line == stop_line

      set.add(token)
    end

    set
  end
end

print Namespace.new(ARGV[0]).fetch
