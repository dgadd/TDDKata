using System.Collections.Generic;
using Gaddzeit.Kata.Support.Domain;

namespace Gaddzeit.Kata.Support.View
{
    public interface ICustomerViewEvents
    {
        void FindCustomersByCityId(int cityId);
    }
}