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

        public bool Equals(DomainEntityBase other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;
            return other._id == _id;
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != typeof (DomainEntityBase)) return false;
            return Equals((DomainEntityBase) obj);
        }

        public override int GetHashCode()
        {
            return _id;
        }

        public static bool operator ==(DomainEntityBase left, DomainEntityBase right)
        {
            return Equals(left, right);
        }

        public static bool operator !=(DomainEntityBase left, DomainEntityBase right)
        {
            return !Equals(left, right);
        }
    }
}