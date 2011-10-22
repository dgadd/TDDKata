using System;

namespace Gaddzeit.Kata.Domain
{
    public class Gym : DomainEntityBase
    {
        private string _name;

        protected Gym(){}

        public static Gym Create(string name)
        {
            return new Gym {Name = name};
        }

        public string Name
        {
            get {
                return _name;
            }
            set {
                _name = value;
            }
        }
    }
}