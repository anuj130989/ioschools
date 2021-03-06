using System.Collections.Generic;

namespace ioschoolsWebsite.Models.school.json
{
    public class SchoolTermJSON
    {
        public int year { get; set; }
        public int id { get; set; }  // schoolid
        public IEnumerable<TermJSON> terms { get; set; } 
    }
}