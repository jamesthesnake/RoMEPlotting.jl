module RoMEPlotting

using Cairo, Fontconfig

using Reexport
@reexport using Gadfly
@reexport using Colors

using Statistics, LinearAlgebra
using StatsBase
using Compose
using Dates
using DistributedFactorGraphs
using KernelDensityEstimate, KernelDensityEstimatePlotting
using IncrementalInference, RoME
using DocStringExtensions
using ApproxManifoldProducts
using TensorCast
using Requires
using SnoopPrecompile

# import ApproxManifoldProducts: mmd! # future dependency

import Gadfly: plot
import KernelDensityEstimatePlotting: plot, drawHorDens, plotKDE
import KernelDensityEstimatePlotting: getColorsByLength
import KernelDensityEstimatePlotting: plotKDE



# assuming this is a good size for everybody
@info "For larger plots when using a browswer, run Gadfly.set_default_plot_size(30cm,20cm)"
# Gadfly.set_default_plot_size(30cm,20cm)


include("ExportAPI.jl")

# EXPERIMENTAL
const AbstractMatrix__{T} = Union{AbstractArray{T,2}, Adjoint{T,<:AbstractArray{T,2}}}

# will be overwritten if flux is present (dont make const)
PlotTypesPose2 = Union{Type{Pose2Pose2}, Type{Pose2Point2BearingRange}, Type{Pose2Point2Range}, Type{Pose2Point2Bearing}}
ExtendedPose2Pose2Types = Pose2Pose2

include("services/PlotBelief.jl")
include("SolverVisualization.jl")
include("services/PlotEllipseUtils.jl")
include("RobotViz.jl")
include("services/PlotPose.jl")
include("services/PlotTree.jl")
include("CurrentlyUnmaintained.jl")
include("PlotHexUtils.jl")
include("PlotFactors.jl")
include("PlotVariables.jl")
include("PlotFactorsReload.jl")
include("Deprecated.jl")
include("NeedsFixing.jl")

function __init__()
  @require Flux="587475ba-b771-5e3f-ad9e-33799f191a9c" include("FluxSpecificFeatures.jl")
  @require ImageMagick="6218d12a-5da1-5696-b52f-db25d2ecc6d1" include("imagemagick.jl")
  @require Caesar="62eebf14-49bc-5f46-9df9-f7b7ef379406" include("services/ScatterAlignPlotting.jl")  
end

@precompile_all_calls begin
  # In here put "toy workloads" that exercise the code you want to precompile
  fg = generateGraph_Hexagonal()
  initAll!(fg)
  plotSLAM2D(fg)
  plotSLAM2D(fg; drawEllipse=true, drawContour=true)
  plotSLAM2D(fg; drawEllipse=true, drawContour=false)
  plotSLAM2D(fg; drawEllipse=true, drawContour=false, drawPoints=false)

  plotBelief(fg, ls(fg); dims=[1;2])
end

end
