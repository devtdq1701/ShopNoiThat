namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Comment
    {
        public long ID { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Tên")]
        public string Name { get; set; }

        [Required]
        [StringLength(12)]
        [Display(Name = "SĐT")]
        public string Mobile { get; set; }

        [Required]
        [StringLength(250)]
        public string Email { get; set; }

        [Required]
        [Display(Name = "Nội dung")]
        public string Content { get; set; }

        [Display(Name = "Trạng thái")]
        public bool Status { get; set; }

        [Display(Name = "Thời gian gửi")]
        public DateTime? SentDate { get; set; }
    }
}
