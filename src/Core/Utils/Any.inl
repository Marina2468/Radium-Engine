#include <Core/Utils/Any.hpp>
#include <Core/Log/Log.hpp>

#include <locale>

namespace Ra
{
    namespace Core
    {
        template <typename T>
        inline Any::Any(const T& t)
        {
            m_value = std::shared_ptr<AnyValueBase>(new AnyValue<T>(t));
        }

        template <typename T>
        inline const T& Any::as() const
        {
            if (magicNumberFor<T>() != m_value->magicNumber)
            {
                // FIXME(Charly): Better way to handle those errors ?
                CORE_ERROR("Wrong cast types.");
            }

            return std::static_pointer_cast<const AnyValue<T>>(m_value)->value;
        }

        inline int nextMagicNumber()
        {
            static int magic(0);
            return magic++;
        }
        
        template <typename T>
        inline int magicNumberFor()
        {
            static int result(nextMagicNumber());
            return result;
        }

        template <typename T>
        inline Any::AnyValue<T>::AnyValue(const T& v)
            : Any::AnyValueBase(magicNumberFor<T>())
            , value(v)
        {
        }
    }
}