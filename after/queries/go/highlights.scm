(package_identifier) @goTSpackage_identifier

(function_declaration
	name: (identifier) @goTSfunction_name)

(parameter_declaration
  name: (identifier) @goTSvariable)

(call_expression
	function: (identifier) @goTSfunction_name)

; Property
(method_declaration
	name: (field_identifier) @goTSfunction_name)

; Method with pointer
(method_declaration
	name: (field_identifier) @goTSfunction_name)

(selector_expression
  field: (field_identifier) @goTSproperty)
