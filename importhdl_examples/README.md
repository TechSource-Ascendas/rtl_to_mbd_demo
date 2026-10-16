# importhdl coding-pattern examples

Small Verilog files, one coding pattern each, used to answer *"Does my Verilog need a special structure for `importhdl`?"* (Part 2, section A4).
Results are from MATLAB R2026a with HDL Coder.

To try one, `cd` into its folder and run, for example:

```matlab
importhdl("t02_async_reset.v")
```

The generated model is written to `hdlimport/<module>/` inside that folder.

## Imports as written

| Case | Pattern | Result |
| --- | --- | --- |
| t01_sync_reset | `always @(posedge clk)` with synchronous `if (rst)` | Imported; `clk` and `rst` identified |
| t02_async_reset | `always @(posedge clk or posedge rst)` | Imported |
| t03_async_reset_n | `negedge rst_n` active-low asynchronous reset | Imported; reset handled implicitly |
| t08_function | `function` with saturating add | Imported (Switch, Sum) |
| t09b_generate_all | `generate for` that assigns every element | Imported |
| t10_for_loop | `for` loop inside `always` | Imported (unrolled) |
| t11_rom_initial | ROM via `initial` constant assignments | Imported (Constant + Multiport Switch) |
| t12_rom_case | ROM via `case` | Imported (Constant + Multiport Switch) |
| t13_ram | Synchronous RAM | Imported (RAM block) |
| t15_hierarchy | Two-level hierarchy with `#(.W(16))` | Imported |
| t16_mult_div | `*` and `/` | Imported (Product) |
| t17_display | `$display` in `always` | Imported; `$display` ignored |
| t18_casez | `casez` priority encoder | Imported (Multiport Switch) |
| t19_fsm | FSM with `localparam` states | Imported |
| t21_include | `` `include `` header with `` `define `` | Imported |
| t22_reset_name | Clock named `clock`, sync clear named `sclr` | Imported; `sclr` becomes a data input unless you name it with the `clockBundle` option |

## Rejected

| Case | Pattern | importhdl message | Fix |
| --- | --- | --- | --- |
| t04_two_clocks | Two clocks in one module | Multiple clocks are not supported | One module per clock domain, or black-box it |
| t05_both_edges | `posedge` and `negedge clk` in one module | Clock sensitivity to different clock edges in same module is not supported | Use one edge per module |
| t06_latch | Incomplete `if` in `always @(*)` | Latch logic is detected | Add `else` / `default` |
| t07_task | `task` | 'task' is not supported | Use a `function` |
| t09_generate_for | Vector assigned partly inside, partly outside `generate` | Only certain indices of the vector signal have been assigned values | Assign all indices in one construct (see t09b) |
| t14_inout | `inout` / tri-state | Inout port type is not supported | Keep I/O buffers in the top-level RTL |
| t20_mixed_sync_async | Sync and async reset styles in one module | Synchronous and Asynchronous circuit realization is not supported within same module | One reset style per module |
| t23_sv_always_ff | SystemVerilog (`.sv`, `always_ff`, `logic`) | Language must be `'Verilog'` or `'VHDL'` | Convert to Verilog-2001, or black-box it |
