namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class AdvisoryCustomer
    {
        public long ID { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Tên")]
        public string FullName { get; set; }

        [Display(Name = "Giới tính")]
        public bool Sex { get; set; }

        [Required]
        [StringLength(12)]
        [Display(Name = "SĐT")]
        public string Mobile { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Display(Name = "Nội dung")]
        public string Note { get; set; }

        [StringLength(50)]
        [Display(Name = "Trạng thái")]
        public string Status { get; set; }

        [Display(Name = "Thời gian gửi")]
        public DateTime? SentDate { get; set; }

        [Display(Name = "Sản phẩm cần tư vấn")]
        public long ProductID { get; set; }
    }
}
