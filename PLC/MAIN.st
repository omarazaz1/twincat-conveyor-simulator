PROGRAM MAIN
VAR
    fbConveyor     : FB_Conveyor;
    tonPartPulse   : TON;
    bSimulatedPart : BOOL;
END_VAR

IF GVL_HMI.bAutoSimulatePart AND GVL_HMI.bMotorRunning THEN
    tonPartPulse(IN := NOT tonPartPulse.Q, PT := T#3S);
    bSimulatedPart := tonPartPulse.ET >= T#2500MS;
ELSE
    tonPartPulse(IN := FALSE, PT := T#3S);
    bSimulatedPart := FALSE;
END_IF

GVL_HMI.bPartSensor := bSimulatedPart OR GVL_HMI.bManualPartSensor;

fbConveyor(
    bStart         := GVL_HMI.bStartCommand,
    bStop          := GVL_HMI.bStopCommand,
    bReset         := GVL_HMI.bResetCommand,
    bEmergencyStop := GVL_HMI.bEmergencyStop,
    bPartSensor    := GVL_HMI.bPartSensor
);

GVL_HMI.bMotorRunning := fbConveyor.bMotorRunning;
GVL_HMI.bFaultActive  := fbConveyor.bFaultActive;
GVL_HMI.nPartCount    := fbConveyor.nPartCount;
GVL_HMI.eMachineState := fbConveyor.eState;

GVL_HMI.bStartCommand := FALSE;
GVL_HMI.bStopCommand  := FALSE;
GVL_HMI.bResetCommand := FALSE;
