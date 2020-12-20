namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Project
    {
        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Tiêu đề")]
        public string Title { get; set; }

        [StringLength(250)]
        [Display(Name = "Thẻ SEO")]
        public string MetaTitle { get; set; }

        [Required]
        [Display(Name = "Mô tả tóm tắt")]
        public string ShortDesc { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Hình ảnh")]
        public string Image { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        [Display(Name = "Chi tiết")]
        public string Content { get; set; }

        [Display(Name = "Thời giạn tạo")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(20)]
        [Display(Name = "Người tạo")]
        public string CreatedBy { get; set; }

        [Display(Name = "Thời gian sửa")]
        public DateTime? UpdatedDate { get; set; }

        [StringLength(20)]
        [Display(Name = "Người sửa")]
        public string UpdatedBy { get; set; }

        [Display(Name = "Trạng thái")]
        public bool Status { get; set; }

        [Display(Name = "Loại dự án")]
        public int CategoryID { get; set; }

        public virtual ProjectCategory ProjectCategory { get; set; }
    }
}
