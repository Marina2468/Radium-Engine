
set( core_sources
    Animation/Animation.cpp
    Animation/BulgeCorrection.cpp
    Animation/Cage.cpp
    Animation/DualQuaternionSkinning.cpp
    Animation/Handle.cpp
    Animation/HandleWeightOperation.cpp
    Animation/LinearBlendSkinning.cpp
    Animation/PoseOperation.cpp
    Animation/RotationCenterSkinning.cpp
    Animation/Sequence.cpp
    Animation/Skeleton.cpp
    Animation/StretchableTwistableBoneSkinning.cpp
    Asset/AnimationData.cpp
    Asset/BlinnPhongMaterialData.cpp
    Asset/CameraData.cpp
    Asset/FileData.cpp
    Asset/GeometryData.cpp
    Asset/HandleData.cpp
    Asset/HandleToSkeleton.cpp
    Asset/LightData.cpp
    Asset/MaterialData.cpp
    Containers/AdjacencyList.cpp
    Geometry/Adjacency.cpp
    Geometry/Area.cpp
    Geometry/CatmullClarkSubdivider.cpp
    Geometry/HeatDiffusion.cpp
    Geometry/Laplacian.cpp
    Geometry/LoopSubdivider.cpp
    Geometry/MeshPrimitives.cpp
    Geometry/Normal.cpp
    Geometry/PolyLine.cpp
    Geometry/RayCast.cpp
    Geometry/TopologicalMesh.cpp
    Geometry/TriangleMesh.cpp
    Geometry/TriangleOperation.cpp
    Geometry/VertexDistance.cpp
    Resources/Resources.cpp
    Tasks/TaskQueue.cpp
    Utils/Attribs.cpp
    Utils/CircularIndex.cpp
    Utils/StringUtils.cpp
    )

set( core_headers
    Animation/Animation.hpp
    Animation/AnimationTime.hpp
    Animation/BulgeCorrection.hpp
    Animation/Cage.hpp
    Animation/DualQuaternionSkinning.hpp
    Animation/Handle.hpp
    Animation/HandleWeight.hpp
    Animation/HandleWeightOperation.hpp
    Animation/Interpolation.hpp
    Animation/KeyFrame.hpp
    Animation/KeyPose.hpp
    Animation/KeyRotation.hpp
    Animation/KeyScaling.hpp
    Animation/KeyTransform.hpp
    Animation/KeyTranslation.hpp
    Animation/LinearBlendSkinning.hpp
    Animation/Pose.hpp
    Animation/PoseOperation.hpp
    Animation/RotationCenterSkinning.hpp
    Animation/Sequence.hpp
    Animation/Skeleton.hpp
    Animation/SkinningData.hpp
    Animation/StretchableTwistableBoneSkinning.hpp
    Asset/AnimationData.hpp
    Asset/AssetData.hpp
    Asset/BlinnPhongMaterialData.hpp
    Asset/CameraData.hpp
    Asset/DataLoader.hpp
    Asset/FileData.hpp
    Asset/FileLoaderInterface.hpp
    Asset/GeometryData.hpp
    Asset/HandleData.hpp
    Asset/HandleToSkeleton.hpp
    Asset/LightData.hpp
    Asset/MaterialData.hpp
    Containers/AdjacencyList.hpp
    Containers/Algorithm.hpp
    Containers/AlignedAllocator.hpp
    Containers/AlignedStdVector.hpp
    Containers/BVH.hpp
    Containers/Grid.hpp
    Containers/Iterators.hpp
    Containers/MakeShared.hpp
    Containers/Tex.hpp
    Containers/VectorArray.hpp
    CoreMacros.hpp
    Geometry/AbstractGeometry.hpp
    Geometry/Adjacency.hpp
    Geometry/Area.hpp
    Geometry/CatmullClarkSubdivider.hpp
    Geometry/Curve2D.hpp
    Geometry/DistanceQueries.hpp
    Geometry/Frustum.hpp
    Geometry/HeatDiffusion.hpp
    Geometry/Laplacian.hpp
    Geometry/LoopSubdivider.hpp
    Geometry/MeshPrimitives.hpp
    Geometry/Normal.hpp
    Geometry/Obb.hpp
    Geometry/OpenMesh.h
    Geometry/PolyLine.hpp
    Geometry/RayCast.hpp
    Geometry/Spline.hpp
    Geometry/TopologicalMesh.hpp
    Geometry/TriangleMesh.hpp
    Geometry/TriangleOperation.hpp
    Geometry/VertexDistance.hpp
    Math/DualQuaternion.hpp
    Math/GlmAdapters.hpp
    Math/LinearAlgebra.hpp
    Math/Math.hpp
    Math/Quadric.hpp
    RaCore.hpp
    Resources/Resources.hpp
    Tasks/Task.hpp
    Tasks/TaskQueue.hpp
    Types.hpp
    Utils/Attribs.hpp
    Utils/Chronometer.hpp
    Utils/CircularIndex.hpp
    Utils/Color.hpp
    Utils/Index.hpp
    Utils/IndexMap.hpp
    Utils/IndexedObject.hpp
    Utils/Log.hpp
    Utils/Observable.hpp
    Utils/Singleton.hpp
    Utils/StdOptional.hpp
    Utils/StdUtils.hpp
    Utils/StringUtils.hpp
    Utils/Timer.hpp
    Utils/Version.hpp
    )

set( core_inlines
    Animation/Handle.inl
    Animation/Sequence.inl
    Asset/AnimationData.inl
    Asset/BlinnPhongMaterialData.inl
    Asset/CameraData.inl
    Asset/FileData.inl
    Asset/GeometryData.inl
    Asset/HandleData.inl
    Asset/LightData.inl
    Asset/MaterialData.inl
    Containers/AdjacencyList.inl
    Containers/BVH.inl
    Containers/Grid.inl
    Containers/Tex.inl
    Geometry/Curve2D.inl
    Geometry/DistanceQueries.inl
    Geometry/MeshPrimitives.inl
    Geometry/PolyLine.inl
    Geometry/Spline.inl
    Geometry/TopologicalMesh.inl
    Geometry/TriangleMesh.inl
    Math/DualQuaternion.inl
    Math/LinearAlgebra.inl
    Math/Math.inl
    Math/Quadric.inl
    Utils/Attribs.inl
    Utils/CircularIndex.inl
    Utils/Index.inl
    Utils/IndexMap.inl
    )
