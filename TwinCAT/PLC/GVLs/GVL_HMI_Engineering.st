{attribute 'qualified_only'}
VAR_GLOBAL
    bAutoSimulationEnabled : BOOL := TRUE;
    bManualEntrySensor     : BOOL := FALSE;
    bManualExitSensor      : BOOL := FALSE;
    bInjectFault           : BOOL := FALSE;
    bResetCounter          : BOOL := FALSE;

    bSimulatedEntrySensor  : BOOL := FALSE;
    bSimulatedExitSensor   : BOOL := FALSE;
    nSimulationStep        : UINT := 0;
END_VAR
