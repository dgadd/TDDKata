using System;

namespace Gaddzeit.Kata.Domain
{
    public class DomainEntityBase
    {
        private int _id;
        private Guid _transientId;

        public DomainEntityBase()
        {
            _transientId = System.Guid.NewGuid();
        }

        public int Id
        {
            get {
                return _id;
            }
            set {
                _id = value;
            }
        }

        public Guid TransientId
        {
            get {
                return _transientId;
            }
            set {
                _transientId = value;
            }
        }

        public override bool Equals(object obj)
        {
            var other = obj as DomainEntityBase;
            if(other != null)
            {
                if (other.Id > 0 && this.Id > 0)
                    return other.Id.Equals(this.Id);
                return other.TransientId.Equals(this.TransientId);
            }
            return false;
        }

        public override int GetHashCode()
        {
            return this.Id > 0 ? this.Id.GetHashCode() : this.TransientId.GetHashCode();
        }
    }
}