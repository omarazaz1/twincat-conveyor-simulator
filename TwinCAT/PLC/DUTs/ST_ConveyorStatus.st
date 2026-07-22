TYPE ST_ConveyorStatus :
STRUCT
    eState        : E_MachineState;
    bMotorRunning : BOOL;
    bEntrySensor  : BOOL;
    bExitSensor   : BOOL;
    bFaultActive  : BOOL;
    nPartCount    : UDINT;
END_STRUCT
END_TYPE
