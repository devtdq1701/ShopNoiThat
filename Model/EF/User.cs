namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        public long ID { get; set; }

        [Required]
        [StringLength(20)]
        [Display(Name = "Tên đăng nhập")]
        public string UserName { get; set; }

        [Required]
        [StringLength(250)]
        [Display(Name = "Mật khẩu")]
        public string Password { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        [Required]
        [StringLength(20)]
        [Display(Name = "Số điện thoại")]
        public string Mobile { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Tên đầy đủ")]
        public string Name { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }

        [Display(Name = "Giới tính")]
        public bool Sex { get; set; }
    }
}
