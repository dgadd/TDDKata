using System;
using System.Collections.Generic;
using System.Reflection;

namespace DomainModel.Utilities
{
    public static class InterfaceImplementor
    {
        private static readonly Dictionary<Type, Type> PairedInterfaceStorage = new Dictionary<Type, Type>();

        public static void AssignImplementationToInterface<T, T1>()
        {
            PairedInterfaceStorage.Add(typeof(T), typeof(T1));
        }

        public static T Resolve<T>()
        {
            Type implementedType = null;
            var what = PairedInterfaceStorage.TryGetValue(typeof (T), out implementedType);
            if (implementedType == null)
                throw new Exception(string.Format("You must assign and implementation in your client for interface {0}", typeof(T).Name));
            var implementedInstance = (T) Assembly.GetAssembly(typeof(T)).CreateInstance(implementedType.FullName);
            return implementedInstance;
        }
    }
}