# Setup and run

1. Extract the folder and open it in VS Code.
2. Open your existing TwinCAT project using `UmRT_Default`.
3. Under **DUTs**, add an enumeration named `E_MachineState`; copy the content from `PLC/DUT_E_MachineState.st`.
4. Under **GVLs**, add a Global Variable List named `GVL_HMI`; copy `PLC/GVL_HMI.st`.
5. Under **POUs**, add a Function Block named `FB_Conveyor` in Structured Text.
6. In TwinCAT's upper declaration pane, paste the declaration from `PLC/FB_Conveyor.st` through the final `END_VAR`.
7. Paste the remaining logic into the lower implementation pane.
8. Open `MAIN`. Paste the declaration section from `PLC/MAIN.st` into the upper pane and the remaining logic into the lower pane.
9. Build the solution and correct any copy errors.
10. Activate Configuration, restart UmRT in Run mode, PLC Login, approve download, then PLC Start.

Test online:
- Write `TRUE` once to `GVL_HMI.bStartCommand`.
- The motor should run.
- With automatic simulation enabled, the part count should increase.
- Write `TRUE` once to Stop or Reset.
- Set Emergency Stop to TRUE to create a fault.
