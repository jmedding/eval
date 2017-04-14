# Fox Transfer Factory

alias Eval.Repo
alias Eval.Dropper
alias Eval.Instance
alias Eval.Review

d = Repo.insert! %Dropper {
	brand: "Fox",
	model: "Transfer Factory",
	manUrl: "http://www.ridefox.com/2016/family.php?m=bike&family=seatpost",
	from: Ecto.Date.cast!("2016-05-15"),
	to: Ecto.Date.cast!("2018-01-01"),
	internal: true,
	reliability: 4.0
}

# Instances


	Repo.insert! %Instance {
				partNo: "925-01-041",
	    	diameter: "30.9",
	    	length: "100",
	    	price: 379.0,
	    	weight: 567.0,
	    	remark: "Remote price included",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "925-01-043",
	    	diameter: "30.9",
	    	length: "125",
	    	price: 379.0,
	    	weight: 577.0,
	    	remark: "Remote price included",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "925-01-051",
	    	diameter: "30.9",
	    	length: "150",
	    	price: 379.0,
	    	weight: 587.0,
	    	remark: "Remote price included",
	    	dropper_id: d.id
	}

	Repo.insert! %Instance {
				partNo: "925-01-044",
	    	diameter: "31.6",
	    	length: "100",
	    	price: 379.0,
	    	weight: 575.0,
	    	remark: "Remote price included",
	    	dropper_id: d.id
	}


	Repo.insert! %Instance {
				partNo: "925-01-046",
	    	diameter: "31.6",
	    	length: "125",
	    	price: 379.0,
	    	weight: 585.0,
	    	remark: "Remote price included",
	    	dropper_id: d.id
	}


	Repo.insert! %Instance {
				partNo: "925-01-048",
	    	diameter: "31.6",
	    	length: "150",
	    	price: 379.0,
	    	weight: 595.0,
	    	remark: "Remote price included",
	    	dropper_id: d.id
	}

# Reviews

	Repo.insert! %Review {
			title: "Fox Transfer Dropper Seat Post - Review",
			publisher: "Pinkbike",
			review_url: "https://www.pinkbike.com/news/fox-transfer-dropper-seat-post-review-2016.html",
			logo_url: nil,
			reliability: 5.0,
			publisher_weight: 4.0,
			summary: "New post review. No reliability issues in the first 30 rides. Fast up and down speeds, but not too fast. 1X lever position is a bit akward. Qualified shop needed to do maintenance on hydraulic parts.",
			published_on: Ecto.Date.cast!("2016-06-07"),
			rating: 3,
			dropper_id: d.id
	}

		Repo.insert! %Review {
			title: "Is this the new king?",
			publisher: "Enduro Mountain Bike Magazine",
			review_url: "http://enduro-mtb.com/en/fox-transfer-dropper-post-review-new-king/",
			logo_url: nil,
			reliability: 5.0,
			publisher_weight: 3.0,
			summary: "New post review. No reliability issues in the first 6 weeks of rides. Easy and precise up and down adjustment. Qualified shop needed to do maintenance on hydraulics. Easy installation.",
			published_on: Ecto.Date.cast!("2016-06-07"),
			rating: 3,
			dropper_id: d.id
	}

			Repo.insert! %Review {
			title: "A dropper post worthy of the Fox Factory name",
			publisher: "Bikeradar",
			review_url: "http://www.bikeradar.com/mtb/gear/category/components/seat-post-seat-pin/product/fox-transfer-factory-dropper-seatpost-50901/",
			logo_url: nil,
			reliability: 5.0,
			publisher_weight: 4.0,
			summary: "6 month review. No reliability and very pleased with the operation and installation. Rated as the  best post available.",
			published_on: Ecto.Date.cast!("2016-11-29"),
			rating: 3,
			dropper_id: d.id
	}