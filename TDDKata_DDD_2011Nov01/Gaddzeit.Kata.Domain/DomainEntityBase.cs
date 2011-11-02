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
            var other = obj as DomainEntityBase;
            return other != null 
                && other.Id > 0 && 
                this.Id > 0 
                && other.Id.Equals(this.Id);
        }

        public override int GetHashCode()
        {
            return this.Id.GetHashCode();
        }
    }
}