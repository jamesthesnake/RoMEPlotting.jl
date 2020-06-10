
## =============================================================================
## Delete end v0.3.x
## =============================================================================

export drawPoses, drawLandms, drawPosesLandms
export drawSubmaps, drawMarginalContour, drawFeatTrackers, investigatePoseKDE
export drawHorBeliefsList, drawUpMsgAtCliq, drawFactorBeliefs
export drawPose2DMC!


# """
#     $(SIGNATURES)
#
# Standardize the length colors used by RoMEPlotting.
#
# Notes
# - Duplicated in KernelDensityEstimatePlotting
# """
# function getColorsByLength(len::Int=10)::Vector{String}
#   COLORS = String["red";"green";"blue";"black";"deepskyblue";"yellow";"magenta"]
#   morecyan = ["cyan" for i in (length(COLORS)+1):len]
#   retc = [COLORS; morecyan]
#   return retc[1:len]
# end


@deprecate drawPoses(x...; kwargs...) plotSLAM2DPoses(x...; kwargs...)
@deprecate drawLandms(x...; kwargs...) plotSLAM2DLandmarks(x...; kwargs...)
@deprecate drawPosesLandms(x...; kwargs...) plotSLAM2D(x...; kwargs...)
@deprecate drawSubmaps(x...; kwargs...) plotSLAM2DSubmaps(x...; kwargs...)
@deprecate drawMarginalContour(x...; kwargs...) plotMarginalContour(x...; kwargs...)
@deprecate drawFeatTrackers(x...; kwargs...) plotFeatTrackers(x...; kwargs...)
@deprecate drawHorBeliefsList(x...; kwargs...) plotHorBeliefsList(x...; kwargs...)
@deprecate drawUpMsgAtCliq(x...; kwargs...) plotUpMsgAtCliq(x...; kwargs...)
@deprecate drawFactorBeliefs(x...; kwargs...) plotFactorBeliefs(x...; kwargs...)
@deprecate drawPose2DMC!(x...; kwargs...) plotPose2DMC!(x...; kwargs...)


# deprecated
function investigatePoseKDE(p::BallTreeDensity, p0::BallTreeDensity)
    return investigateMultidimKDE(p, p0)
end


function investigatePoseKDE(p::Array{BallTreeDensity,1})
    return investigateMultidimKDE(p)
end

function investigatePoseKDE(p::BallTreeDensity)
    return investigateMultidimKDE(p)
end

@deprecate investigatePoseKDE(x...; kwargs...) plotPose(x...; kwargs...)



# function vArrPotentials(potens::Dict{Symbol,EasyMessage})
#   vv = Array{Gadfly.Compose.Context,1}(length(potens))
#   i = 0
#   oned=false
#   for p in potens
#       i+=1
#       pb = kde!(p[2].pts, p[2].bws)
#       if size(p[2].pts,1) > 3
#         # vv[i] = plotKDE(pb)
#         error("can't handle higher dimensional plots here yet")
#       elseif size(p[2].pts,1) > 1
#         vv[i] = investigateMultidimKDE(pb)
#       else
#         vv[i] = plotKDE(pb)
#       end
#   end
#   return vv
# end


# function draw(em::EasyMessage;xlbl="X")
#   p = Union{}
#   if size(em.pts,1) == 1
#     p=plotKDE(kde!(em),xlbl=xlbl)
#   else
#     p=plotKDE(kde!(em))
#   end
#   return p
# end

export drawOneMC!
export drawMCMCDebug
export drawTreeUpwardMsgs
export drawFrontalDens
export drawUpMCMCPose2D!
export drawDwnMCMCPose2D!
export drawLbl
export drawAnalysis
export drawAllPose2DBeliefs
export drawComicStripLM
export drawComicStrip

@deprecate drawOneMC!(x...; kwargs...) plotOneMC!(x...; kwargs...)
@deprecate drawMCMCDebug(x...; kwargs...) plotMCMCDebug(x...; kwargs...)
@deprecate drawTreeUpwardMsgs(x...; kwargs...) plotTreeUpwardMsgs(x...; kwargs...)
@deprecate drawFrontalDens(x...; kwargs...) plotFrontalDens(x...; kwargs...)
@deprecate drawUpMCMCPose2D!(x...; kwargs...) plotUpMCMCPose2D!(x...; kwargs...)
@deprecate drawDwnMCMCPose2D!(x...; kwargs...) plotDwnMCMCPose2D!(x...; kwargs...)
@deprecate drawLbl(x...; kwargs...) plotLbl(x...; kwargs...)
@deprecate drawAnalysis(x...; kwargs...) plotAnalysis(x...; kwargs...)
@deprecate drawAllPose2DBeliefs(x...; kwargs...) plotAllPose2DBeliefs(x...; kwargs...)
@deprecate drawComicStripLM(x...; kwargs...) plotComicStripLM(x...; kwargs...)
@deprecate drawComicStrip(x...; kwargs...) plotComicStrip(x...; kwargs...)



# function plotKDE(fgl::FactorGraph,
#                  vsym::Vector{Symbol};
#                  axis=nothing,
#                  dims=nothing,
#                  c=getColorsByLength(length(vsym)),
#                  levels::Int=4,
#                  title::Union{Nothing, T}=nothing,
#                  overlay=nothing  ) where {T <: AbstractString}
#   #
#   @warn "plotKDE for FactorGraph is deprecated, use DistributedFactorGraphs objects instead."
#   verts = map((x)->getKDE(getVariable(fgl, x)), vsym)
#   plotKDE(verts, dims=dims, c=c, axis=axis, levels=levels, title=title, overlay=overlay )
# end
#
# function plotKDE(fgl::FactorGraph,
#                  vsym::Symbol;
#                  axis=nothing,
#                  dims=nothing,
#                  c=nothing,
#                  levels=4,
#                  title::Union{Nothing, T}=nothing) where {T <: AbstractString}
#   #
#   @warn "plotKDE for FactorGraph is deprecated, use DistributedFactorGraphs objects instead."
#   plotKDE(fgl, Symbol[vsym;], dims=dims, c=c, axis=axis, levels=levels, title=title)
# end



#