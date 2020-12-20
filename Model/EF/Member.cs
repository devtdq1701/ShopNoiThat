namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Member
    {
        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Tên")]
        public string Name { get; set; }

        [Required]
        [StringLength(250)]
        public string Slogan { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Ảnh đại diện")]
        public string Avatar { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Nghề nghiệp")]
        public string Job { get; set; }

        [Display(Name = "Trạng thái")]
        public bool Status { get; set; }
    }
}
