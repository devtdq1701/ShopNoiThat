namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class About
    {
        public int ID { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        [Display(Name = "Nội dung HTML")]
        public string ContentHtml { get; set; }

        [Display(Name = "Trạng thái")]
        public bool Status { get; set; }
    }
}
