# ME5414 Project

> Author: Cao Chenyu

## Introduction

This project undertakes a comparative study of two Linear Programming (LP) solvers: the classic Simplex method and the modern Barrier method. Our analysis is grounded on computational efficiency, tolerance sensitivity, and adaptability to diverse problem structures, utilizing a suite of standard LP test problems for a comprehensive evaluation.

## Project Structure

```txt
ME5414_Project
├─ assets
│  ├─ results.png
│  ├─ results_constraints.png
│  ├─ results_tolerance.png
│  └─ results_variables.png
├─ data
│  ├─ adlittle.mps
│  ├─ afiro.mps
│  ├─ sc50a.mps
│  └─ share1b.mps
├─ matlabPaths.txt
├─ README.md
├─ report_typ
│  ├─ main.pdf
│  ├─ main.typ
│  └─ refs.bib
├─ src
│  ├─ barrier_solver.m
│  ├─ generate_problems.m
│  ├─ load_problem_data.m
│  ├─ main.m
│  ├─ run_experiments.m
│  ├─ run_experiments_struct.m
│  ├─ run_tolerance_experiments.m
│  ├─ simplex_solver.m
│  ├─ visualize_results.m
│  ├─ visualize_results_constraints.m
│  ├─ visualize_results_variables.m
│  └─ visualize_tolerance_results.m
└─ startup.m
```

## Usage

To run the experiments:

1. Ensure MATLAB is installed and the paths are configured correctly in `matlabPaths.txt`.
2. Navigate to the `src/` directory and run `main.m` to execute all experiments.
3. View results in the `assets/` directory or compile the `report_typ/` directory for the full report.

## Contributions

This project is part of coursework for ME5414. Contributions are limited to academic collaborations only.

## License

This project is proprietary and confidential. Unauthorized copying, distribution, or use is strictly prohibited.
