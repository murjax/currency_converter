# Currency Converter

RubyJax Intro to Ruby Workshop project for the March 2025 meetup.
The goal is to build out a script that does currency conversion and formatting.

### System Requirements
- Ruby 3.4.2

### Core Objectives
1. Prompt the user for the amount in USD and currency to convert to.
2. Read and parse the conversion chart JSON file.
3. Convert the value into the selected currency using the conversion chart.
4. Round the converted value to two decimal places.
5. Format and print the value into the standard format for the selected currency.
   Note that EUR has different thousands and fractional delimiters than USD or GBP
   Examples:
   - USD: $4,814.25
   - GBP: £3.734.41
   - EUR: €4.455,11
6. Support entering a list of USD amounts to add and convert to another currency.

### Intermediate Objectives
1. Users may not always respond to the prompt correctly. Can you handle a scenario where an invalid currency is entered?
   Similarly, can you handle a scenario where non-numeric characters are entered?
2. Can you create a class for the conversion logic? We may want to re-use this later.

### Advanced Objectives
1. Can uou ensure addition works on large amounts? See unit test for problem scenario.
2. Can you get current conversion rates from an API?
