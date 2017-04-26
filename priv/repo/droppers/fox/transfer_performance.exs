# Fox Transfer Performance

alias Eval.Repo
alias Eval.Dropper
alias Eval.Instance
alias Eval.Review

d = Repo.insert! %Dropper {
	brand: "Fox",
	model: "Transfer Performance",
	manUrl: "http://www.ridefox.com/2016/family.php?m=bike&family=seatpost",
	from: Ecto.Date.cast!("2016-05-15"),
	to: Ecto.Date.cast!("2018-01-01"),
	internal: true,
	actuator: "cable",
	reliability: 4.0
}

# Instances


	Repo.insert! %Instance {
				partNo: "925-01-030",
	    	diameter: "30.9",
	    	length: "100",
	    	price: 379.0,
	    	weight: 567.0,
	    	remark: "Remote price included",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "925-01-032",
	    	diameter: "30.9",
	    	length: "125",
	    	price: 379.0,
	    	weight: 587.0,
	    	remark: "Remote price included",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "925-01-053",
	    	diameter: "30.9",
	    	length: "150",
	    	price: 379.0,
	    	weight: 610.0,
	    	remark: "Remote price included",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "925-01-031",
	    	diameter: "31.6",
	    	length: "100",
	    	price: 379.0,
	    	weight: 595.0,
	    	remark: "Remote price included",
	    	dropper_id: d.id
	}


	Repo.insert! %Instance {
				partNo: "925-01-033",
	    	diameter: "31.6",
	    	length: "125",
	    	price: 379.0,
	    	weight: 645.0,
	    	remark: "Remote price included",
	    	dropper_id: d.id
	}


	Repo.insert! %Instance {
				partNo: "925-01-034",
	    	diameter: "31.6",
	    	length: "150",
	    	price: 379.0,
	    	weight: 679.0,
	    	remark: "Remote price included",
	    	dropper_id: d.id
	}

# Reviews

			Repo.insert! %Review {
			title: "Super reliable dropper post that's easy to set up and use",
			publisher: "Bikeradar",
			review_url: "http://www.bikeradar.com/mtb/gear/category/components/seat-post-seat-pin/product/fox-transfer-performance-dropper-seatpost-50809/",
			logo_url: nil,
			reliability: 5.0,
			publisher_weight: 3.0,
			summary: "Very pleased with the operation and installation. No indication of duration of the test.",
			published_on: Ecto.Date.cast!("2016-10-29"),
			rating: 3,
			dropper_id: d.id
	}

	Repo.insert! %Review {
			title: "Fox Transfer Dropper - Midterm Review",
			publisher: "Fanatikbike",
			review_url: "https://www.fanatikbike.com/blogs/engage/fox-transfer-dropper-mid-term-review",
			logo_url: nil,
			reliability: 5.0,
			publisher_weight: 4.0,
			summary: "6 month review. Both the Factory and Performance models tested with heavy use in a wet and muddy PNW fall and winter. No reliability issues on the riders post and no warranty issues from any of the posts sold by the shop (over 100). Especially pleased with the transfer's ability to function consitently in extreme cold or over large elevation changes. The transfer is one of the heavier posts on the market and it is a bit longer than its competition as well.",
			published_on: Ecto.Date.cast!("2016-12-20"),
			rating: 3,
			dropper_id: d.id
	}