{attribute 'qualified_only'}
VAR_GLOBAL
    bStartCommand     : BOOL := FALSE;
    bStopCommand      : BOOL := FALSE;
    bResetCommand     : BOOL := FALSE;
    bEmergencyStop    : BOOL := FALSE;

    bAutoSimulatePart : BOOL := TRUE;
    bManualPartSensor : BOOL := FALSE;

    bMotorRunning     : BOOL := FALSE;
    bPartSensor       : BOOL := FALSE;
    bFaultActive      : BOOL := FALSE;
    nPartCount        : UDINT := 0;
    eMachineState     : E_MachineState := E_MachineState.Stopped;
END_VAR
