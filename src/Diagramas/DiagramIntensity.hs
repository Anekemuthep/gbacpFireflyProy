module Diagramas.DiagramIntensity (main) where

import Lib.Prelude

import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Diagrams(toFile)

signal1 :: [Double] -> [(Double,Double)]
signal1 xs = [ (x, exp(-1*(abs x))) | x <- xs ]

signal2 :: [Double] -> [(Double, Double)]
signal2 xs = [ (x, exp(-1*x)) | x <- xs]

signal3 :: [Double] -> [(Double, Double)]
signal3 xs = [ (x, exp(abs x)) | x <- xs]

main = toFile def "/Users/alfonsobustamante/mychart.svg" $ do
    layout_title .= "Intensity function with different values of gamma"
    setColors [opaque blue, opaque red, opaque green]
    plot (line "intensity with FFA definition" [signal1 [(-1),(-0.09)..1]])
    plot (points "intensity with -alpha" (signal2 [(-1),(-0.09)..1]))
    prot (line "intensity with Binary FFA definition" (signal3 [(-1),(-0.09)..1]))