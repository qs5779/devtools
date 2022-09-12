def generate_template(target, tmplfn, data, replace=True):
    require_file(tmplfn)
    with open(tmplfn) as file_:
        template = Template(file_.read())
    require_dir(os.path.dirname(target))
    if replace:
        remove_file(target)
    with open(target, "a") as file_:
        if not replace:
            file_.write("\n")
        file_.write(template.render(**data))
        file_.write("\n")
    if replace:
        print("generated: %s" % target)
    else:
        print("appended to: %s" % target)
