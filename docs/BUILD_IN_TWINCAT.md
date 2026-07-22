# Build in TwinCAT XAE

1. Open TwinCAT XAE.
2. Create a new **TwinCAT XAE Project**.
3. Save it inside this repository under `TwinCAT`.
4. Name the solution `ConveyorCell`.
5. Add a **Standard PLC Project** named `ConveyorPLC`.

Create these DUTs:
- `E_MachineState`
- `ST_ConveyorStatus`

Create these GVLs:
- `GVL_HMI_Operator`
- `GVL_HMI_Engineering`
- `GVL_IO`

Create these Structured Text function blocks:
- `FB_Conveyor`
- `FB_PartSimulator`

Replace `MAIN` with `TwinCAT/PLC/POUs/MAIN.st`.

For each function block, put the declaration in TwinCAT's upper pane and the
implementation in the lower pane.

Then:

1. Select `UmRT_Default`.
2. Build the solution.
3. Activate Configuration.
4. Restart the Usermode Runtime in Run mode.
5. PLC Login.
6. Approve download.
7. PLC Start.

Create two PLC visualizations:
- `Visu_Operator`
- `Visu_Engineering`

Use the specifications in `TwinCAT/PLC/Visualization`.

Add a navigation button on each screen to switch between them.
