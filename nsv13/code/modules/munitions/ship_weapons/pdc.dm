/obj/machinery/ship_weapon/pdc_mount
	name = "PDC loading rack"
	icon = 'nsv13/icons/obj/munitions.dmi'
	icon_state = "pdc"
	desc = "Seegson's all-in-one PDC targeting computer, ammunition loader, and human interface has proven extremely popular in recent times. It's rare to see a ship without one of these."
	anchored = TRUE
	density = FALSE
	pixel_y = 26
	magazine_type = /obj/item/ammo_box/magazine/pdc
	linked = null
	load_delay = 50
	unload_delay = 50

	feeding_sound = null
	fed_sound = null
	feed_delay = 0
	chamber_sound = null
	chamber_delay_rapid = 0
	chamber_delay = 0
	semi_auto = TRUE
	max_ammo = 100
	maintainable = FALSE
	auto_load = TRUE

/obj/machinery/ship_weapon/pdc_mount/set_position(obj/structure/overmap/OM) //Use this to tell your ship what weapon category this belongs in
	OM.pdcs += src

/obj/machinery/ship_weapon/pdc_mount/update_icon()
	if(!magazine)
		icon_state = "[initial(icon_state)]_0"
		return
	var/progress = magazine.ammo_count() //How damaged is this shield? We examine the position of index "I" in the for loop to check which directional we want to check
	var/goal = magazine.max_ammo //How much is the max hp of the shield? This is constant through all of them
	progress = CLAMP(progress, 0, goal)
	progress = round(((progress / goal) * 100), 20)//Round it down to 20%. We now apply visual damage
	icon_state = "[initial(icon_state)]_[progress]"

/obj/item/ammo_box/magazine/pdc
	name = "Point defense cannon ammo (30.12x82mm)"
	desc = "A box of .30 caliber rounds which can be loaded into a ship's point defense emplacements. These are typically used to shoot down oncoming missiles, and provide close quarters combat relief for large ships."
	icon_state = "pdc"
	ammo_type = /obj/item/ammo_casing/pdc
	caliber = "mm30.12"
	max_ammo = 100


/obj/item/ammo_box/magazine/pdc/update_icon()
	if(ammo_count() > 10)
		icon_state = "pdc"
	else
		icon_state = "pdc_empty"

/obj/item/ammo_casing/pdc
	name = "30.12x82mm bullet casing"
	desc = "A 30.12x82mm bullet casing."
	projectile_type = /obj/item/projectile/bullet/pdc_round