# Operator HMI

Create a visualization named `Visu_Operator`.

| Control | Variable |
|---|---|
| START momentary button | `GVL_HMI_Operator.bStartCommand` |
| STOP momentary button | `GVL_HMI_Operator.bStopCommand` |
| RESET momentary button | `GVL_HMI_Operator.bResetCommand` |
| E-STOP toggle | `GVL_HMI_Operator.bEmergencyStop` |
| Motor lamp | `GVL_HMI_Operator.stStatus.bMotorRunning` |
| Fault lamp | `GVL_HMI_Operator.stStatus.bFaultActive` |
| Entry lamp | `GVL_HMI_Operator.stStatus.bEntrySensor` |
| Exit lamp | `GVL_HMI_Operator.stStatus.bExitSensor` |
| Part count display | `GVL_HMI_Operator.stStatus.nPartCount` |
| Machine-state display | `GVL_HMI_Operator.stStatus.eState` |

Suggested layout:

```text
+--------------------------------------------------+
|             CONVEYOR CELL - OPERATOR             |
+--------------------------------------------------+
| State: ________       Parts: ________             |
|                                                  |
| [START] [STOP] [RESET]      [EMERGENCY STOP]     |
|                                                  |
| Motor [ ] Entry [ ] Exit [ ] Fault [ ]           |
+--------------------------------------------------+
```
