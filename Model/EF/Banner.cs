namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Banner")]
    public partial class Banner
    {
        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Tiêu đề")]
        public string Title { get; set; }

        [StringLength(250)]
        [Display(Name = "Đường dẫn")]
        public string Link { get; set; }

        [Display(Name = "Loại banner")]
        public int Type { get; set; }

        [Display(Name = "Trạng thái")]
        public bool Status { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Ảnh")]
        public string Image { get; set; }

        public virtual BannerGroup BannerGroup { get; set; }
    }
}
