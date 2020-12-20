namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Logo
    {
        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Ảnh")]
        public string Image { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Tiêu đề")]
        public string Title { get; set; }

        [Display(Name = "Trạng thái")]
        public bool Status { get; set; }
    }
}
