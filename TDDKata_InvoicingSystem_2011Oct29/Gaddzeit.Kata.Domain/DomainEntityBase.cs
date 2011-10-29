using System;

namespace Gaddzeit.Kata.Domain
{
    public class DomainEntityBase
    {
        private int _id;

        public int Id
        {
            get {
                return _id;
            }
            set {
                _id = value;
            }
        }

        public override bool Equals(object obj)
        {
            var other = (DomainEntityBase) obj;
            return other.Id.Equals(this.Id);
        }

        public override int GetHashCode()
        {
            return this.Id.GetHashCode();
        }
    }
}