# Matestack Bootstrap Form: Checkbox

The Bootstrap `checkbox` form component, implemented in Ruby. Use it like any of the other matestack form components in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the configuration options.

## `bootstrap_checkbox(*args, &block)`
----

Renders one or multiple bootstrap checkbox input fields.

**Optional options**

* `label` - Expects a string, gets displayed before the first input field

* `form_text` - Expects a string, gets displayed after the last input field

* `disabled` - If set to `:true`, the checkbox input fields are set to disabled and clicking them doesn't yield any effect

* `variant` - If set to `:inline`, the wrapping `div` is displayed as `inline-block` instead of the default `block`

## Examples

### Example 1: Basic usage with single checkbox field

```ruby
bootstrap_checkbox label: "Single checkbox", key: :some_checkbox_input
```

returns

```html
<div class="form-check ">
  <input type="hidden" value="" class="">
  <input id="_" name="some_checkbox_input" type="checkbox" value="1" class="form-check-input">
  <label for="_" class="form-check-label">Single checkbox</label>
</div>
```

and sends

```ruby
"some_checkbox_input"=>false # or true, if the input has been clicked
```

to the corresponding Controller.

### Example 2: Basic usage with an Array

```ruby
bootstrap_checkbox key: :foo, options: [1, 2]
```

returns

```html
<div class="form-check ">
  <input id="_1" name="1" type="checkbox" value-type="Integer" value="1" class="form-check-input">
  <label for="_1" class="form-check-label">1</label>
</div>
<div class="form-check ">
  <input id="_2" name="2" type="checkbox" value-type="Integer" value="2" class="form-check-input">
  <label for="_2" class="form-check-label">2</label>
</div>
```

### Example 3: Basic usage with a Hash

```ruby
bootstrap_checkbox key: :foo, options: { "Option 1": 1, "Option 2": 2 }
```

returns

```html
<div class="form-check ">
  <input id="_1" name="Option 1" type="checkbox" value-type="Integer" value="1" class="form-check-input">
  <label for="_1" class="form-check-label">Option 1</label>
</div>
<div class="form-check ">
  <input id="_2" name="Option 2" type="checkbox" value-type="Integer" value="2" class="form-check-input">
  <label for="_2" class="form-check-label">Option 2</label>
</div>
```

### Example 4: Using a label

```ruby
bootstrap_checkbox key: :foo, options: [1, 2], label: "Some label"
```

returns

```html
<label for="foo" class="form-label">Some label</label>
<div class="form-check ">
  <input id="_1" name="1" type="checkbox" value-type="Integer" value="1" class="form-check-input">
  <label for="_1" class="form-check-label">1</label>
</div>
<div class="form-check ">
  <input id="_2" name="2" type="checkbox" value-type="Integer" value="2" class="form-check-input">
  <label for="_2" class="form-check-label">2</label>
</div>
```

### Example 5: Using a form_text

```ruby
bootstrap_checkbox key: :foo, options: [1, 2], form_text: "some notes"
```

returns

```html
<div class="form-check ">
  <input id="_1" name="1" type="checkbox" value-type="Integer" value="1" class="form-check-input">
  <label for="_1" class="form-check-label">1</label>
</div>
<div class="form-check ">
  <input id="_2" name="2" type="checkbox" value-type="Integer" value="2" class="form-check-input">
  <label for="_2" class="form-check-label">2</label>
</div>
<div id="form_text_for_foo" class="form-text">some notes</div>
```

### Example 6: Using the `disabled` option

```ruby
bootstrap_checkbox key: :foo, options: [1, 2], disabled: true
```

returns

```html
<div class="form-check ">
  <input disabled="disabled" id="_1" name="1" type="checkbox" value-type="Integer" value="1" class="form-check-input">
  <label for="_1" class="form-check-label">1</label>
</div>
<div class="form-check ">
  <input disabled="disabled" id="_2" name="2" type="checkbox" value-type="Integer" value="2" class="form-check-input">
  <label for="_2" class="form-check-label">2</label>
</div>
```

### Example 7: Using the `:inline` variant

```ruby
bootstrap_checkbox key: :foo, options: [1, 2], variant: :inline
```

returns

```html
<div class="form-check form-check-inline">
  <input id="_1" name="1" type="checkbox" value-type="Integer" value="1" class="form-check-input">
  <label for="_1" class="form-check-label">1</label>
</div>
<div class="form-check form-check-inline">
  <input id="_2" name="2" type="checkbox" value-type="Integer" value="2" class="form-check-input">
  <label for="_2" class="form-check-label">2</label>
</div>
```