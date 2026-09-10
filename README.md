# Differential Equation Solver

A small MATLAB command-line tool for solving **first-order and second-order homogeneous linear ODEs with constant coefficients**. You type in the equation as a string (e.g. `y' + 3y = 0` or `y'' + 5y' + 6y = 0`), and the tool parses the coefficients, solves the characteristic equation, and prints the general solution.

## Features

- Interactive prompt that walks you through solving an equation
- Solves first-order homogeneous ODEs of the form `ay' + by = 0`
- Solves second-order homogeneous ODEs of the form `ay'' + by' + cy = 0` (real roots only)
- Simple string parser — no symbolic toolbox required

## Requirements

- MATLAB (any reasonably recent version; no toolboxes beyond base MATLAB are required)

## Getting Started

1. Clone or download this repository.
2. Open the folder in MATLAB (or add it to your MATLAB path).
3. Run the solver:

   ```matlab
   ODEsolver
   ```

4. Follow the prompts:

   ```
   Do you wish to solve a differential equation? (Answer with Y for yes and N for no): Y
   What kind of differential equation do you wish to solve?
   1. First Order Homogeneous Differential Equations
   2. Second Order Homogeneous Differential Equations
   Please select your choice by typing in a number. 2
   Please enter the 2nd order differential equation you wish to solve: y'' + 5y' + 6y = 0
   ```

   Output:

   ```
   The solution to the equation y''+5y'+6y=0 is
   y = Ae^(-2t) + Be^(-3t), where A and B are constants.
   ```

## Usage Notes / Equation Format

- Write the equation exactly as you would on paper, e.g. `2y'' + 3y' + y = 0` or `y' + 4y = 0`.
- Omit the coefficient when it's `1` (e.g. use `y'` rather than `1y'`), just as you normally would — the parser assumes a missing coefficient is `1`.
- Spaces are ignored, so `y'' + 5y' + 6y = 0` and `y''+5y'+6y=0` both work.
- Second-order solutions are only computed when the characteristic equation has **real roots**. If the roots are complex, the tool reports that it cannot compute a solution.

## Project Structure

| File               | Description                                                                 |
|--------------------|-------------------------------------------------------------------------------|
| `ODEsolver.m`      | Entry point — interactive prompt that routes to the correct solver.         |
| `Homo1stOrder.m`    | Parses and solves first-order homogeneous equations `ay' + by = 0`.          |
| `Homo2ndOrder.m`    | Parses and solves second-order homogeneous equations `ay'' + by' + cy = 0`.  |
| `quad.m`           | Helper function that returns the two roots of a quadratic `ax² + bx + c = 0`.|

## How It Works

1. `ODEsolver.m` asks whether you want to solve an equation and, if so, whether it's first- or second-order.
2. The equation string is tokenized (split on `'` and `=`) to extract the numeric coefficients.
3. For a first-order equation `ay' + by = 0`, the solution is `y = Ae^(ct)` where `c = -b/a`.
4. For a second-order equation `ay'' + by' + cy = 0`, `quad.m` solves the characteristic equation `ar² + br + c = 0` for its roots, and (when both roots are real) the solution is `y = Ae^(r1·t) + Be^(r2·t)`.

## Limitations

- Only handles **homogeneous** equations (right-hand side must be `0`).
- Only supports **first- and second-order** equations.
- Second-order equations with **complex or repeated roots** are not solved.
- The equation parser expects a specific format and coefficients before `y`, `y'`, and `y''` — nonstandard formatting may not parse correctly.

## Possible Improvements

- Support for non-homogeneous equations (particular solutions)
- Support for complex and repeated roots
- Support for higher-order equations
- More robust equation parsing (e.g. handling equations not set to zero, extra whitespace variants)

## License

No license specified. Add one if you plan to share or reuse this code.
