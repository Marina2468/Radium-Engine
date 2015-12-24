#ifndef RADIUMENGINE_RENDEROBJECT_HPP
#define RADIUMENGINE_RENDEROBJECT_HPP

#include <Engine/RaEngine.hpp>

#include <string>
#include <mutex>
#include <memory>

#include <Core/Index/IndexedObject.hpp>
#include <Core/Math/LinearAlgebra.hpp>
#include <Engine/Renderer/RenderTechnique/Material.hpp>
#include <Engine/Renderer/RenderTechnique/RenderParameters.hpp>

namespace Ra
{
    namespace Engine
    {
        class Light;
        struct RenderTechnique;
        class Component;
        class Mesh;
        class RenderQueue;
    }
}

namespace Ra
{
    namespace Engine
    {

        // FIXME(Charly): Does this need a bit of cleanup ?
        class RA_ENGINE_API RenderObject : public Core::IndexedObject
        {
        public:
            enum class Type
            {
                RO_OPAQUE, /// Default normal shaded object
                RO_TRANSPARENT, /// Drawn on a separate pass
                RO_XRAY, /// Drawn on top of other objects
                RO_DEBUG, /// Specific debug objects
                RO_UI /// UI objects (drawn on top)
            };

        public:

            RA_CORE_ALIGNED_NEW

            RenderObject( const std::string& name, const Component* comp, bool drawFixedSize = false  );
            ~RenderObject();

            //
            // Drawing related functions
            //
            void updateGL();

            void feedRenderQueue( RenderQueue& queue );

            // Rendering stuff
            void bind() const;
            void bind( const RenderParameters& params ) const;
            void bind( ShaderProgram* shader ) const;
            void bind( ShaderProgram* shader, const RenderParameters& params ) const;

            void render() const;

            RenderObject* clone( bool cloneMesh = true );

            //
            // Getters and setters.
            //
            inline const std::string& getName() const;
            inline const Component* getComponent() const;

            inline void setType( const Type& type );
            inline const Type& getType() const;

            inline void setVisible( bool visible );
            inline bool isVisible() const;

            inline bool isDirty() const;

            inline void setRenderTechnique( RenderTechnique* technique );
            inline const RenderTechnique* getRenderTechnique() const;
            inline RenderTechnique* getRenderTechnique();

            inline void setMesh( const std::shared_ptr<Mesh>& mesh );
            inline const Mesh* getMesh() const;
            inline Mesh* getMesh();

            inline void setLocalTransform( const Core::Transform& transform );
            inline void setLocalTransform( const Core::Matrix4& transform );
            inline const Core::Transform& getLocalTransform() const;
            inline const Core::Matrix4& getLocalTransformAsMatrix() const;

            inline void addRenderParameters( const RenderParameters& parameters );

        private:
            Core::Transform m_localTransform;

            const Component* m_component;
            std::string m_name;

            Type m_type;
            RenderTechnique* m_renderTechnique;
            std::shared_ptr<Mesh> m_mesh;

            RenderParameters m_renderParameters;

            bool m_visible;
            bool m_isDirty;

            mutable std::mutex m_updateMutex;
        };

    } // namespace Engine
} // namespace Ra

#include <Engine/Renderer/RenderObject/RenderObject.inl>

#endif // RADIUMENGINE_RENDEROBJECT_HPP
