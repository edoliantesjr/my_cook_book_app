class Recipe {
  String? promotion;
  String? slug;
  String? thumbnailUrl;
  List<Sections>? sections;
  String? canonicalId;
  dynamic beautyUrl;
  dynamic buzzId;
  bool? isShoppable;
  int? showId;
  dynamic brandId;
  String? name;
  dynamic prepTimeMinutes;
  List<Renditions>? renditions;
  String? aspectRatio;
  dynamic totalTimeMinutes;
  UserRatings? userRatings;
  dynamic totalTimeTier;
  List<Instructions>? instructions;
  List<Topics>? topics;
  int? approvedAt;
  dynamic inspiredByUrl;
  String? servingsNounPlural;
  int? updatedAt;
  String? yields;
  String? videoAdContent;
  String? country;
  String? language;
  dynamic seoTitle;
  String? keywords;
  int? numServings;
  int? videoId;
  String? videoUrl;
  dynamic brand;
  dynamic cookTimeMinutes;
  String? draftStatus;
  bool? isOneTop;
  List<Compilations>? compilations;
  List<Tags>? tags;
  List<Credits>? credits;
  String? servingsNounSingular;
  String? thumbnailAltText;
  String? nutritionVisibility;
  bool? tipsAndRatingsEnabled;
  String? originalVideoUrl;
  Show? show;
  Nutrition? nutrition;
  int? createdAt;
  dynamic description;
  int? id;

  Recipe(
      {this.promotion,
      this.slug,
      this.thumbnailUrl,
      this.sections,
      this.canonicalId,
      this.beautyUrl,
      this.buzzId,
      this.isShoppable,
      this.showId,
      this.brandId,
      this.name,
      this.prepTimeMinutes,
      this.renditions,
      this.aspectRatio,
      this.totalTimeMinutes,
      this.userRatings,
      this.totalTimeTier,
      this.instructions,
      this.topics,
      this.approvedAt,
      this.inspiredByUrl,
      this.servingsNounPlural,
      this.updatedAt,
      this.yields,
      this.videoAdContent,
      this.country,
      this.language,
      this.seoTitle,
      this.keywords,
      this.numServings,
      this.videoId,
      this.videoUrl,
      this.brand,
      this.cookTimeMinutes,
      this.draftStatus,
      this.isOneTop,
      this.compilations,
      this.tags,
      this.credits,
      this.servingsNounSingular,
      this.thumbnailAltText,
      this.nutritionVisibility,
      this.tipsAndRatingsEnabled,
      this.originalVideoUrl,
      this.show,
      this.nutrition,
      this.createdAt,
      this.description,
      this.id});

  Recipe.fromJson(Map<String, dynamic> json) {
    promotion = json['promotion'];
    slug = json['slug'];
    thumbnailUrl = json['thumbnail_url'];
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(Sections.fromJson(v));
      });
    }
    canonicalId = json['canonical_id'];
    beautyUrl = json['beauty_url'];
    buzzId = json['buzz_id'];
    isShoppable = json['is_shoppable'];
    showId = json['show_id'];
    brandId = json['brand_id'];
    name = json['name'];
    prepTimeMinutes = json['prep_time_minutes'];
    if (json['renditions'] != null) {
      renditions = <Renditions>[];
      json['renditions'].forEach((v) {
        renditions!.add(Renditions.fromJson(v));
      });
    }
    aspectRatio = json['aspect_ratio'];
    totalTimeMinutes = json['total_time_minutes'];
    userRatings = json['user_ratings'] != null
        ? UserRatings.fromJson(json['user_ratings'])
        : null;
    totalTimeTier = json['total_time_tier'];
    if (json['instructions'] != null) {
      instructions = <Instructions>[];
      json['instructions'].forEach((v) {
        instructions!.add(Instructions.fromJson(v));
      });
    }

    if (json['topics'] != null) {
      topics = <Topics>[];
      json['topics'].forEach((v) {
        topics!.add(Topics.fromJson(v));
      });
    }
    approvedAt = json['approved_at'];
    inspiredByUrl = json['inspired_by_url'];
    servingsNounPlural = json['servings_noun_plural'];
    updatedAt = json['updated_at'];
    yields = json['yields'];
    videoAdContent = json['video_ad_content'];
    country = json['country'];
    language = json['language'];
    seoTitle = json['seo_title'];
    keywords = json['keywords'];
    numServings = json['num_servings'];
    videoId = json['video_id'];
    videoUrl = json['video_url'];
    brand = json['brand'];
    cookTimeMinutes = json['cook_time_minutes'];
    draftStatus = json['draft_status'];
    isOneTop = json['is_one_top'];
    if (json['compilations'] != null) {
      compilations = <Compilations>[];
      json['compilations'].forEach((v) {
        compilations!.add(Compilations.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    if (json['credits'] != null) {
      credits = <Credits>[];
      json['credits'].forEach((v) {
        credits!.add(Credits.fromJson(v));
      });
    }
    servingsNounSingular = json['servings_noun_singular'];
    thumbnailAltText = json['thumbnail_alt_text'];
    nutritionVisibility = json['nutrition_visibility'];
    tipsAndRatingsEnabled = json['tips_and_ratings_enabled'];
    originalVideoUrl = json['original_video_url'];
    show = json['show'] != null ? Show.fromJson(json['show']) : null;
    nutrition = json['nutrition'] != null
        ? Nutrition.fromJson(json['nutrition'])
        : null;
    createdAt = json['created_at'];
    description = json['description'];
    id = json['id'];
  }
}

class Sections {
  List<Components>? components;
  dynamic name;
  int? position;

  Sections({this.components, this.name, this.position});

  Sections.fromJson(Map<String, dynamic> json) {
    if (json['components'] != null) {
      components = <Components>[];
      json['components'].forEach((v) {
        components!.add(Components.fromJson(v));
      });
    }
    name = json['name'];
    position = json['position'];
  }
}

class Components {
  int? id;
  String? rawText;
  String? extraComment;
  int? position;
  List<Measurements>? measurements;
  Ingredient? ingredient;

  Components(
      {this.id,
      this.rawText,
      this.extraComment,
      this.position,
      this.measurements,
      this.ingredient});

  Components.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rawText = json['raw_text'];
    extraComment = json['extra_comment'];
    position = json['position'];
    if (json['measurements'] != null) {
      measurements = <Measurements>[];
      json['measurements'].forEach((v) {
        measurements!.add(Measurements.fromJson(v));
      });
    }
    ingredient = json['ingredient'] != null
        ? Ingredient.fromJson(json['ingredient'])
        : null;
  }
}

class Measurements {
  int? id;
  String? quantity;
  Unit? unit;

  Measurements({this.id, this.quantity, this.unit});

  Measurements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
  }
}

class Unit {
  String? system;
  String? name;
  String? abbreviation;
  String? displaySingular;
  String? displayPlural;

  Unit(
      {this.system,
      this.name,
      this.abbreviation,
      this.displaySingular,
      this.displayPlural});

  Unit.fromJson(Map<String, dynamic> json) {
    system = json['system'];
    name = json['name'];
    abbreviation = json['abbreviation'];
    displaySingular = json['display_singular'];
    displayPlural = json['display_plural'];
  }
}

class Ingredient {
  String? displaySingular;
  String? displayPlural;
  int? createdAt;
  int? updatedAt;
  int? id;
  String? name;

  Ingredient(
      {this.displaySingular,
      this.displayPlural,
      this.createdAt,
      this.updatedAt,
      this.id,
      this.name});

  Ingredient.fromJson(Map<String, dynamic> json) {
    displaySingular = json['display_singular'];
    displayPlural = json['display_plural'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
    name = json['name'];
  }
}

class Renditions {
  int? width;
  int? fileSize;
  int? maximumBitRate;
  String? contentType;
  String? name;
  int? height;
  int? bitRate;
  int? minimumBitRate;
  String? aspect;
  String? container;
  String? url;
  String? posterUrl;
  int? duration;

  Renditions(
      {this.width,
      this.fileSize,
      this.maximumBitRate,
      this.contentType,
      this.name,
      this.height,
      this.bitRate,
      this.minimumBitRate,
      this.aspect,
      this.container,
      this.url,
      this.posterUrl,
      this.duration});

  Renditions.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    fileSize = json['file_size'];
    maximumBitRate = json['maximum_bit_rate'];
    contentType = json['content_type'];
    name = json['name'];
    height = json['height'];
    bitRate = json['bit_rate'];
    minimumBitRate = json['minimum_bit_rate'];
    aspect = json['aspect'];
    container = json['container'];
    url = json['url'];
    posterUrl = json['poster_url'];
    duration = json['duration'];
  }
}

class UserRatings {
  int? countPositive;
  int? countNegative;
  dynamic score;

  UserRatings({this.countPositive, this.countNegative, this.score});

  UserRatings.fromJson(Map<String, dynamic> json) {
    countPositive = json['count_positive'];
    countNegative = json['count_negative'];
    score = json['score'];
  }
}

class Instructions {
  String? displayText;
  int? position;
  int? startTime;
  int? endTime;
  dynamic temperature;
  dynamic appliance;
  int? id;

  Instructions(
      {this.displayText,
      this.position,
      this.startTime,
      this.endTime,
      this.temperature,
      this.appliance,
      this.id});

  Instructions.fromJson(Map<String, dynamic> json) {
    displayText = json['display_text'];
    position = json['position'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    temperature = json['temperature'];
    appliance = json['appliance'];
    id = json['id'];
  }
}

class Topics {
  String? name;
  String? slug;

  Topics({this.name, this.slug});

  Topics.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
  }
}

class Compilations {
  int? createdAt;
  String? language;
  String? name;
  String? slug;
  String? thumbnailAltText;
  String? thumbnailUrl;
  String? aspectRatio;
  List<Show>? show;
  int? id;
  bool? isShoppable;
  String? videoUrl;
  dynamic beautyUrl;
  String? country;
  String? draftStatus;
  String? promotion;
  dynamic buzzId;
  String? description;
  dynamic keywords;
  int? videoId;
  String? canonicalId;
  int? approvedAt;

  Compilations(
      {this.createdAt,
      this.language,
      this.name,
      this.slug,
      this.thumbnailAltText,
      this.thumbnailUrl,
      this.aspectRatio,
      this.show,
      this.id,
      this.isShoppable,
      this.videoUrl,
      this.beautyUrl,
      this.country,
      this.draftStatus,
      this.promotion,
      this.buzzId,
      this.description,
      this.keywords,
      this.videoId,
      this.canonicalId,
      this.approvedAt});

  Compilations.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    language = json['language'];
    name = json['name'];
    slug = json['slug'];
    thumbnailAltText = json['thumbnail_alt_text'];
    thumbnailUrl = json['thumbnail_url'];
    aspectRatio = json['aspect_ratio'];
    if (json['show'] != null) {
      show = <Show>[];
      json['show'].forEach((v) {
        show!.add(Show.fromJson(v));
      });
    }
    id = json['id'];
    isShoppable = json['is_shoppable'];
    videoUrl = json['video_url'];
    beautyUrl = json['beauty_url'];
    country = json['country'];
    draftStatus = json['draft_status'];
    promotion = json['promotion'];
    buzzId = json['buzz_id'];
    description = json['description'];
    keywords = json['keywords'];
    videoId = json['video_id'];
    canonicalId = json['canonical_id'];
    approvedAt = json['approved_at'];
  }
}

class Show {
  int? id;
  String? name;

  Show({this.id, this.name});

  Show.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Tags {
  int? id;
  String? name;
  String? displayName;
  String? type;

  Tags({this.id, this.name, this.displayName, this.type});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['display_name'];
    type = json['type'];
  }
}

class Credits {
  String? type;
  String? name;

  Credits({this.type, this.name});

  Credits.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
  }
}

class Nutrition {
  int? sugar;
  int? fiber;
  String? updatedAt;
  int? calories;
  int? carbohydrates;
  int? fat;
  int? protein;

  Nutrition(
      {this.sugar,
      this.fiber,
      this.updatedAt,
      this.calories,
      this.carbohydrates,
      this.fat,
      this.protein});

  Nutrition.fromJson(Map<String, dynamic> json) {
    sugar = json['sugar'];
    fiber = json['fiber'];
    updatedAt = json['updated_at'];
    calories = json['calories'];
    carbohydrates = json['carbohydrates'];
    fat = json['fat'];
    protein = json['protein'];
  }
}
