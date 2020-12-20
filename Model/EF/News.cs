namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Newses")]
    public partial class News
    {
        public long ID { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Tiêu đề")]
        public string Title { get; set; }

        [Required]
        [Display(Name = "Nội dung tóm tắt")]
        public string ShortDesc { get; set; }

        [StringLength(250)]
        [Display(Name = "Thẻ SEO")]
        public string MetaTitle { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        [Display(Name = "Nội dung HTML")]
        public string ContentHtml { get; set; }

        [StringLength(250)]
        [Display(Name = "Ảnh")]
        public string Image { get; set; }

        [Display(Name = "Thời gian tạo")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(20)]
        [Display(Name = "Tạo bởi")]
        public string CreatedBy { get; set; }

        [Display(Name = "Thời gian sửa")]
        public DateTime? UpdatedDate { get; set; }

        [StringLength(20)]
        [Display(Name = "Sửa bởi")]
        public string UpdatedBy { get; set; }

        [Display(Name = "Loại bài viết")]
        public long? CategoryID { get; set; }

        [Display(Name = "Lượt xem")]
        public int? ViewCount { get; set; }

        [Display(Name = "Trạng thái")]
        public bool Status { get; set; }

        public virtual Category Category { get; set; }
    }
}
