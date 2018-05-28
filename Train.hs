-- The system is required to prevent two trains from occupying the
-- same track segment at the same time.
module Train where

newtype Track = Track [TrackSegment]
data Train = Train
data TrackSegment = SegmentTrain Train | SegmentEmpty
