namespace Gaddzeit.Support.Model
{
    public class DomainEntity
    {
        public int Id;

        public bool Equals(DomainEntity other)
        {
            return other.Id == Id;
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (!(obj is DomainEntity)) return false;
            return Equals((DomainEntity) obj);
        }

        public override int GetHashCode()
        {
            return Id;
        }

        public static bool operator ==(DomainEntity left, DomainEntity right)
        {
            return Equals(left, right);
        }

        public static bool operator !=(DomainEntity left, DomainEntity right)
        {
            return !Equals(left, right);
        }
    }
}