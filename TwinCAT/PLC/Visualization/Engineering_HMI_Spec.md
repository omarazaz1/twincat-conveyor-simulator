# Engineering HMI

Create a visualization named `Visu_Engineering`.

| Control | Variable |
|---|---|
| Auto simulation toggle | `GVL_HMI_Engineering.bAutoSimulationEnabled` |
| Manual entry toggle | `GVL_HMI_Engineering.bManualEntrySensor` |
| Manual exit toggle | `GVL_HMI_Engineering.bManualExitSensor` |
| Inject fault toggle | `GVL_HMI_Engineering.bInjectFault` |
| Reset counter momentary button | `GVL_HMI_Engineering.bResetCounter` |
| Simulated entry lamp | `GVL_HMI_Engineering.bSimulatedEntrySensor` |
| Simulated exit lamp | `GVL_HMI_Engineering.bSimulatedExitSensor` |
| Simulation-step display | `GVL_HMI_Engineering.nSimulationStep` |
| Motor-output lamp | `GVL_IO.bConveyorMotorOutput` |
| Entry-input lamp | `GVL_IO.bEntrySensorInput` |
| Exit-input lamp | `GVL_IO.bExitSensorInput` |

Suggested layout:

```text
+--------------------------------------------------+
|           CONVEYOR CELL - ENGINEERING            |
+--------------------------------------------------+
| Auto simulation [ ]      Simulation step: ____   |
|                                                  |
| Manual entry [ ]         Manual exit [ ]         |
| Inject fault [ ]         [RESET COUNTER]          |
|                                                  |
| Sim entry [ ] Sim exit [ ] Motor [ ]             |
| PLC entry [ ] PLC exit [ ]                       |
+--------------------------------------------------+
```
