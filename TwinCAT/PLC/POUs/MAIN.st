PROGRAM MAIN
VAR
    fbConveyor  : FB_Conveyor;
    fbSimulator : FB_PartSimulator;
END_VAR

fbSimulator(
    bEnable       := GVL_HMI_Engineering.bAutoSimulationEnabled,
    bMotorRunning := GVL_HMI_Operator.stStatus.bMotorRunning
);

GVL_HMI_Engineering.bSimulatedEntrySensor := fbSimulator.bEntrySensor;
GVL_HMI_Engineering.bSimulatedExitSensor := fbSimulator.bExitSensor;
GVL_HMI_Engineering.nSimulationStep := fbSimulator.nStep;

GVL_IO.bEntrySensorInput :=
    GVL_HMI_Engineering.bSimulatedEntrySensor
    OR GVL_HMI_Engineering.bManualEntrySensor;

GVL_IO.bExitSensorInput :=
    GVL_HMI_Engineering.bSimulatedExitSensor
    OR GVL_HMI_Engineering.bManualExitSensor;

fbConveyor(
    bStart         := GVL_HMI_Operator.bStartCommand,
    bStop          := GVL_HMI_Operator.bStopCommand,
    bReset         := GVL_HMI_Operator.bResetCommand,
    bEmergencyStop := GVL_HMI_Operator.bEmergencyStop,
    bInjectFault   := GVL_HMI_Engineering.bInjectFault,
    bEntrySensor   := GVL_IO.bEntrySensorInput,
    bExitSensor    := GVL_IO.bExitSensorInput,
    bResetCounter  := GVL_HMI_Engineering.bResetCounter
);

GVL_HMI_Operator.stStatus := fbConveyor.stStatus;
GVL_IO.bConveyorMotorOutput := fbConveyor.stStatus.bMotorRunning;

GVL_HMI_Operator.bStartCommand := FALSE;
GVL_HMI_Operator.bStopCommand := FALSE;
GVL_HMI_Operator.bResetCommand := FALSE;
GVL_HMI_Engineering.bResetCounter := FALSE;
