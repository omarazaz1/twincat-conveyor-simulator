# Build the first HMI

Use TwinCAT PLC Visualization first; it is simpler than installing the separate TE2000/TF2000 web HMI products.

1. Right-click the PLC project and select **Add > Visualization**.
2. Name it `Visu_Main`.
3. Add controls and connect them as follows:

| Control | Variable |
|---|---|
| START momentary button | `GVL_HMI.bStartCommand` |
| STOP momentary button | `GVL_HMI.bStopCommand` |
| RESET momentary button | `GVL_HMI.bResetCommand` |
| E-STOP toggle | `GVL_HMI.bEmergencyStop` |
| Motor lamp | `GVL_HMI.bMotorRunning` |
| Sensor lamp | `GVL_HMI.bPartSensor` |
| Fault lamp | `GVL_HMI.bFaultActive` |
| Numeric display | `GVL_HMI.nPartCount` |
| Auto sensor toggle | `GVL_HMI.bAutoSimulatePart` |
| Manual sensor button | `GVL_HMI.bManualPartSensor` |

Build, activate, login, start, and open `Visu_Main` in the integrated visualization.
