#!/bin/bash -f
FILELIST='GrossGeneratorActivePowerOutputMeasurements.xsd
GrossGeneratorPowerOutputMeasurements.xsd
GrossGeneratorReactivePowerOutputMeasurements.xsd
SteamGenerationSystemBlowdownFlowMeasurements.xsd
SteamGenerationSystemEnergyOutputMeasurements.xsd
SteamGenerationSystemOutputPressureMeasurements.xsd
SteamGenerationSystemOutputTemperatureMeasurements.xsd'
BASE=SteamGenerationSystemOutputMassFlowMeasurements
for FILE in $FILELIST; do
  Y=`echo $FILE | sed "s/\.xsd//"`
echo Y is $Y
  sed "s/$BASE/$Y/g" < $BASE.xsd > $FILE.new
  mv -f $FILE.new $FILE
  sed "s/$BASE/$Y/g" < Get$BASE.xsd > Get$FILE.new
  mv -f Get$FILE.new Get$FILE
done
