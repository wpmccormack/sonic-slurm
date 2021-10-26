import FWCore.ParameterSet.Config as cms

from Configuration.ProcessModifiers.enableSonicTriton_cff import enableSonicTriton
from Configuration.ProcessModifiers.particleNetSonicTriton_cff import particleNetSonicTriton
from Configuration.ProcessModifiers.particleNetPTSonicTriton_cff import particleNetPTSonicTriton
from Configuration.ProcessModifiers.deepTauSonicTriton_cff import deepTauSonicTriton
from Configuration.ProcessModifiers.deepMETSonicTriton_cff import deepMETSonicTriton

# collect all SonicTriton-related process modifiers her
allSonicTriton = cms.ModifierChain(enableSonicTriton,particleNetSonicTriton)
#allSonicTriton = cms.ModifierChain(enableSonicTriton,particleNetSonicTriton,deepTauSonicTriton)
#allSonicTriton = cms.ModifierChain(enableSonicTriton,deepTauSonicTriton)
