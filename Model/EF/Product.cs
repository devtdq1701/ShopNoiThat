namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Product
    {
        public long ID { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Tiêu đề")]
        public string Title { get; set; }

        [StringLength(50)]
        [Display(Name = "Mã sản phẩm")]
        public string Code { get; set; }

        [StringLength(250)]
        [Display(Name = "Thẻ SEO")]
        public string MetaTitle { get; set; }

        [StringLength(250)]
        [Display(Name = "Ảnh Thumbnail")]
        public string Thumb { get; set; }

        [Column(TypeName = "xml")]
        [Display(Name = "Hình ảnh")]
        public string Images { get; set; }

        [Display(Name = "Giá")]
        public decimal? Price { get; set; }

        [Display(Name = "Số lượng trong kho")]
        public int? Quantity { get; set; }

        [Display(Name = "Ngày tạo")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(20)]
        [Display(Name = "Người tạo")]
        public string CreatedBy { get; set; }

        [Display(Name = "Ngày sửa")]
        public DateTime? UpdatedDate { get; set; }

        [StringLength(20)]
        [Display(Name = "Người sửa")]
        public string UpdatedBy { get; set; }

        [Display(Name = "Loại sản phẩm")]
        public long? CategoryID { get; set; }

        [Display(Name = "Lượt xem")]
        public long? ViewCount { get; set; }

        [Column(TypeName = "ntext")]
        [Display(Name = "Mô tả sản phẩm")]
        public string Detail { get; set; }

        [Column(TypeName = "ntext")]
        [Display(Name = "Mô tả tóm tắt")]
        public string ShortDesc { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }
    }
}
