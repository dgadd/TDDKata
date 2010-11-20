namespace DomainModel.Entities
{
    public class DomainEntity
    {
        public int Id { get; set; }

        public bool Equals(DomainEntity other)
        {
            return other.Id > 0 && other.Id == Id;
        }

        public override bool Equals(object obj)
        {
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