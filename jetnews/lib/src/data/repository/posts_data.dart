import 'package:jetnews/src/domain/model/post_feed.dart';

import '../../domain/model/post.dart';

var pietro = PostAuthor(
  "Pietro Maggi",
  "https://medium.com/@pmaggi",
);
var manuel = PostAuthor(
  "Manuel Vivo",
  "https://medium.com/@manuelvicnt",
);
var florina = PostAuthor(
  "Florina Muntenescu",
  "https://medium.com/@florina.muntenescu",
);
var jose = PostAuthor(
  "Jose Alcérreca",
  "https://medium.com/@JoseAlcerreca",
);
var publication = Publication(
  "Android Developers",
  "https://cdn-images-1.medium.com/max/258/1*u7oZc2_5mrkcFaxkXEyfYA@2x.png",
);

var paragraphsPost1 = [
  Paragraph(
    ParagraphType.text,
    "Working to make our Android application more modular, I ended up with a sample that included a set of on-demand features grouped inside a folder:",
  ),
  Paragraph(
    ParagraphType.text,
    "Pretty standard setup, all the on-demand modules, inside a “features” folder; clean.",
  ),
  Paragraph(
    ParagraphType.text,
    "These modules are included in the settings.gradle file as:",
  ),
  Paragraph(
    ParagraphType.codeBlock,
    "include ':app'\n" +
        "include ':features:module1'\n" +
        "include ':features:module2'\n" +
        "include ':features:module3'\n" +
        "include ':features:module4'",
  ),
  Paragraph(
    ParagraphType.text,
    "These setup works nicely with a single “minor” issue: an empty module named features in the Android view in Android Studio:",
  ),
  Paragraph(
    ParagraphType.text,
    "I can live with that, but I would much prefer to remove that empty module from my project!",
  ),
  Paragraph(
    ParagraphType.header,
    "If you cannot remove it, just rename it!",
  ),
  Paragraph(
    ParagraphType.text,
    "At I/O I was lucky enough to attend the “Android Studio: Tips and Tricks” talk where Ivan Gravilovic, from Google, shared some amazing tips. One of these was a possible solution for my problem: setting a custom path for my modules.",
    [Markup(MarkupType.italic, 41, 72)],
  ),
  Paragraph(
    ParagraphType.text,
    "In this particular case our settings.gradle becomes:",
    [Markup(MarkupType.code, 28, 43)],
  ),
  Paragraph(
    ParagraphType.codeBlock,
    """
        include ':app'
        include ':module1'
        include ':module1'
        include ':module1'
        include ':module1'
        """
        .trim(),
  ),
  Paragraph(
    ParagraphType.codeBlock,
    """
        // Set a custom path for the four features modules.
        // This avoid to have an empty "features" module in  Android Studio.
        project(":module1").projectDir=new File(rootDir, "features/module1")
        project(":module2").projectDir=new File(rootDir, "features/module2")
        project(":module3").projectDir=new File(rootDir, "features/module3")
        project(":module4").projectDir=new File(rootDir, "features/module4")
        """
        .trim(),
  ),
  Paragraph(ParagraphType.text, "And the layout in Android Studio is now:"),
  Paragraph(ParagraphType.header, "Conclusion"),
  Paragraph(
    ParagraphType.text,
    "As the title says, this is really a small thing, but it helps keep my project in order and it shows how a small Gradle configuration can help keep your project tidy.",
  ),
  Paragraph(
    ParagraphType.quote,
    "You can find this update in the latest version of the on-demand modules codelab.",
    [
      Markup(
        MarkupType.link,
        54,
        79,
        "https://codelabs.developers.google.com/codelabs/on-demand-dynamic-delivery/index.html",
      )
    ],
  ),
  Paragraph(ParagraphType.header, "Resources"),
  Paragraph(
    ParagraphType.bullet,
    "Android Studio: Tips and Tricks (Google I/O’19)",
    [
      Markup(
        MarkupType.link,
        0,
        47,
        "https://www.youtube.com/watch?v=ihF-PwDfRZ4&list=PLWz5rJ2EKKc9FfSQIRXEWyWpHD6TtwxMM&index=32&t=0s",
      )
    ],
  ),
  Paragraph(
    ParagraphType.bullet,
    "On Demand module codelab",
    [
      Markup(
        MarkupType.link,
        0,
        24,
        "https://codelabs.developers.google.com/codelabs/on-demand-dynamic-delivery/index.html",
      )
    ],
  ),
  Paragraph(
    ParagraphType.bullet,
    "Patchwork Plaid — A modularization story",
    [
      Markup(
        MarkupType.link,
        0,
        40,
        "https://medium.com/androiddevelopers/a-patchwork-plaid-monolith-to-modularized-app-60235d9f212e",
      )
    ],
  ),
];

var paragraphsPost2 = [
  Paragraph(
    ParagraphType.text,
    "Dagger is a popular Dependency Injection framework commonly used in Android. It provides fully static and compile-time dependencies addressing many of the development and performance issues that have reflection-based solutions.",
    [Markup(MarkupType.link, 0, 6, "https://dagger.dev/")],
  ),
  Paragraph(
    ParagraphType.text,
    "This month, a new tutorial was released to help you better understand how it works. This article focuses on using Dagger with Kotlin, including best practices to optimize your build time and gotchas you might encounter.",
    [
      Markup(MarkupType.link, 14, 26, "https://dagger.dev/tutorial/"),
      Markup(MarkupType.bold, 114, 132),
      Markup(MarkupType.bold, 144, 159),
      Markup(MarkupType.bold, 191, 198)
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "Dagger is implemented using Java’s annotations model and annotations in Kotlin are not always directly parallel with how equivalent Java code would be written. This post will highlight areas where they differ and how you can use Dagger with Kotlin without having a headache.",
  ),
  Paragraph(
    ParagraphType.text,
    "This post was inspired by some of the suggestions in this Dagger issue that goes through best practices and pain points of Dagger in Kotlin. Thanks to all of the contributors that commented there!",
    [
      Markup(
        MarkupType.link,
        58,
        70,
        "https://github.com/google/dagger/issues/900",
      )
    ],
  ),
  Paragraph(ParagraphType.header, "kapt build improvements"),
  Paragraph(
    ParagraphType.text,
    "To improve your build time, Dagger added support for gradle’s incremental annotation processing in v2.18! This is enabled by default in Dagger v2.24. In case you’re using a lower version, you need to add a few lines of code (as shown below) if you want to benefit from it.",
    [
      Markup(
        MarkupType.link,
        99,
        104,
        "https://github.com/google/dagger/releases/tag/dagger-2.18",
      ),
      Markup(
        MarkupType.link,
        143,
        148,
        "https://github.com/google/dagger/releases/tag/dagger-2.24",
      ),
      Markup(MarkupType.bold, 53, 95)
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "Also, you can tell Dagger not to format the generated code. This option was added in Dagger v2.18 and it’s the default behavior (doesn’t generate formatted code) in v2.23. If you’re using a lower version, disable code formatting to improve your build time (see code below).",
    [
      Markup(
        MarkupType.link,
        92,
        97,
        "https://github.com/google/dagger/releases/tag/dagger-2.18",
      ),
      Markup(
        MarkupType.link,
        165,
        170,
        "https://github.com/google/dagger/releases/tag/dagger-2.23",
      )
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "Include these compiler arguments in your build.gradle file to make Dagger more performant at build time:",
    [Markup(MarkupType.code, 41, 53)],
  ),
  Paragraph(
    ParagraphType.text,
    "Alternatively, if you use Kotlin DSL script files, include them like this in the build.gradle.kts file of the modules that use Dagger:",
    [Markup(MarkupType.code, 81, 97)],
  ),
  Paragraph(ParagraphType.text, "Qualifiers for field attributes"),
  Paragraph(
    ParagraphType.text,
    "",
    [Markup(MarkupType.link, 0, 0)],
  ),
  Paragraph(
    ParagraphType.text,
    "When an annotation is placed on a property in Kotlin, it’s not clear whether Java will see that annotation on the field of the property or the method for that property. Setting the field: prefix on the annotation ensures that the qualifier ends up in the right place (See documentation for more details).",
    [
      Markup(MarkupType.code, 181, 187),
      Markup(
        MarkupType.link,
        268,
        285,
        "http://frogermcs.github.io/dependency-injection-with-dagger-2-custom-scopes/",
      ),
      Markup(MarkupType.italic, 114, 119),
      Markup(MarkupType.italic, 143, 149)
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "✅ The way to apply qualifiers on an injected field is:",
  ),
  Paragraph(
    ParagraphType.codeBlock,
    "@Inject @field:MinimumBalance lateinit var minimumBalance: BigDecimal",
    [Markup(MarkupType.bold, 8, 29)],
  ),
  Paragraph(ParagraphType.text, "❌ As opposed to:"),
  Paragraph(
    ParagraphType.codeBlock,
    """
        @Inject @MinimumBalance lateinit var minimumBalance: BigDecimal 
        // @MinimumBalance is ignored!
        """
        .trim(),
    [Markup(MarkupType.bold, 65, 95)],
  ),
  Paragraph(
    ParagraphType.text,
    "Forgetting to add field: could lead to injecting the wrong object if there’s an unqualified instance of that type available in the Dagger graph.",
    [Markup(MarkupType.code, 18, 24)],
  ),
  Paragraph(ParagraphType.header, "Static @Provides functions optimization"),
  Paragraph(
    ParagraphType.text,
    "Dagger’s generated code will be more performant if @Provides methods are static. To achieve this in Kotlin, use a Kotlin object instead of a class and annotate your methods with @JvmStatic. This is a best practice that you should follow as much as possible.",
    [
      Markup(MarkupType.code, 51, 60),
      Markup(MarkupType.code, 73, 79),
      Markup(MarkupType.code, 121, 127),
      Markup(MarkupType.code, 141, 146),
      Markup(MarkupType.code, 178, 188),
      Markup(MarkupType.bold, 200, 213),
      Markup(MarkupType.italic, 200, 213)
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "In case you need an abstract method, you’ll need to add the @JvmStatic method to a companion object and annotate it with @Module too.",
    [Markup(MarkupType.code, 60, 70), Markup(MarkupType.code, 121, 128)],
  ),
  Paragraph(
    ParagraphType.text,
    "Alternatively, you can extract the object module out and include it in the abstract one:",
  ),
  Paragraph(ParagraphType.header, "Injecting Generics"),
  Paragraph(
    ParagraphType.text,
    "Kotlin compiles generics with wildcards to make Kotlin APIs work with Java. These are generated when a type appears as a parameter (more info here) or as fields. For example, a Kotlin List<Foo> parameter shows up as List<? super Foo> in Java.",
    [
      Markup(MarkupType.code, 184, 193),
      Markup(MarkupType.code, 216, 233),
      Markup(
        MarkupType.link,
        132,
        146,
        "https://kotlinlang.org/docs/reference/java-to-kotlin-interop.html#variant-generics",
      )
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "This causes problems with Dagger because it expects an exact (aka invariant) type match. Using @JvmSuppressWildcards will ensure that Dagger sees the type without wildcards.",
    [
      Markup(MarkupType.code, 95, 116),
      Markup(
        MarkupType.link,
        66,
        75,
        "https://en.wikipedia.org/wiki/Class_invariant",
      ),
      Markup(
        MarkupType.link,
        96,
        116,
        "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.jvm/-jvm-suppress-wildcards/index.html",
      )
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "This is a common issue when you inject collections using Dagger’s multibinding feature, for example:",
    [Markup(MarkupType.link, 57, 86, "https://dagger.dev/multibindings.html")],
  ),
  Paragraph(
    ParagraphType.codeBlock,
    """
        class MyVMFactory @Inject constructor(
          private val vmMap: Map<String, @JvmSuppressWildcards Provider<ViewModel>>
        ) { 
            ... 
        }
        """
        .trim(),
    [Markup(MarkupType.bold, 72, 93)],
  ),
  Paragraph(ParagraphType.header, "Inline method bodies"),
  Paragraph(
    ParagraphType.text,
    "Dagger determines the types that are configured by @Provides methods by inspecting the return type. Specifying the return type in Kotlin functions is optional and even the IDE sometimes encourages you to refactor your code to have inline method bodies that hide the return type declaration.",
    [Markup(MarkupType.code, 51, 60)],
  ),
  Paragraph(
    ParagraphType.text,
    "This can lead to bugs if the inferred type is different from the one you meant. Let’s see some examples:",
  ),
  Paragraph(
    ParagraphType.text,
    "If you want to add a specific type to the graph, inlining works as expected. See the different ways to do the same in Kotlin:",
  ),
  Paragraph(
    ParagraphType.text,
    "If you want to provide an implementation of an interface, then you must explicitly specify the return type. Not doing it can lead to problems and bugs:",
  ),
  Paragraph(
    ParagraphType.text,
    "Dagger mostly works with Kotlin out of the box. However, you have to watch out for a few things just to make sure you’re doing what you really mean to do: @field: for qualifiers on field attributes, inline method bodies, and @JvmSuppressWildcards when injecting collections.",
    [Markup(MarkupType.code, 155, 162), Markup(MarkupType.code, 225, 246)],
  ),
  Paragraph(
    ParagraphType.text,
    "Dagger optimizations come with no cost, add them and follow best practices to improve your build time: enabling incremental annotation processing, disabling formatting and using static @Provides methods in your Dagger modules.",
    [Markup(MarkupType.code, 185, 194)],
  )
];

var paragraphsPost3 = [
  Paragraph(
    ParagraphType.text,
    "Learn how to get started converting Java Programming Language code to Kotlin, making it more idiomatic and avoid common pitfalls, by following our new Refactoring to Kotlin codelab, available in English \uD83C\uDDEC\uD83C\uDDE7, Chinese \uD83C\uDDE8\uD83C\uDDF3 and Brazilian Portuguese \uD83C\uDDE7\uD83C\uDDF7.",
    [
      Markup(MarkupType.link, 151, 172,
          "https://codelabs.developers.google.com/codelabs/java-to-kotlin/#0"),
      Markup(MarkupType.link, 209, 216,
          "https://clmirror.storage.googleapis.com/codelabs/java-to-kotlin-zh/index.html#0"),
      Markup(MarkupType.link, 226, 246,
          "https://codelabs.developers.google.com/codelabs/java-to-kotlin-pt-br/#0")
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "When you first get started writing Kotlin code, you tend to follow Java Programming Language idioms. The automatic converter, part of both Android Studio and Intellij IDEA, can do a pretty good job of automatically refactoring your code, but sometimes, it needs a little help. This is where our new Refactoring to Kotlin codelab comes in.",
    [
      Markup(MarkupType.link, 105, 124,
          "https://www.jetbrains.com/help/idea/converting-a-java-file-to-kotlin-file.html")
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "We’ll take two classes (a User and a Repository) in Java Programming Language and convert them to Kotlin, check out what the automatic converter did and why. Then we go to the next level — make it idiomatic, teaching best practices and useful tips along the way.",
    [Markup(MarkupType.code, 26, 30), Markup(MarkupType.code, 37, 47)],
  ),
  Paragraph(
    ParagraphType.text,
    "The Refactoring to Kotlin codelab starts with basic topics — understand how nullability is declared in Kotlin, what types of equality are defined or how to best handle classes whose role is just to hold data. We then continue with how to handle static fields and functions in Kotlin and how to apply the Singleton pattern, with the help of one handy keyword: object. We’ll see how Kotlin helps us model our classes better, how it differentiates between a property of a class and an action the class can do. Finally, we’ll learn how to execute code only in the context of a specific object with the scope functions.",
    [
      Markup(MarkupType.code, 245, 251),
      Markup(MarkupType.code, 359, 365),
      Markup(MarkupType.link, 4, 25,
          "https://codelabs.developers.google.com/codelabs/java-to-kotlin/#0")
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "Thanks to Walmyr Carvalho and Nelson Glauber for translating the codelab in Brazilian Portuguese!",
    [
      Markup(MarkupType.link, 21, 42,
          "https://codelabs.developers.google.com/codelabs/java-to-kotlin/#0")
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "",
    [
      Markup(MarkupType.link, 76, 96,
          "https://codelabs.developers.google.com/codelabs/java-to-kotlin-pt-br/#0")
    ],
  )
];

var paragraphsPost4 = [
  Paragraph(
    ParagraphType.text,
    "TL;DR: Expose resource IDs from ViewModels to avoid showing obsolete data.",
  ),
  Paragraph(
    ParagraphType.text,
    "In a ViewModel, if you’re exposing data coming from resources (strings, drawables, colors…), you have to take into account that ViewModel objects ignore configuration changes such as locale changes. When the user changes their locale, activities are recreated but the ViewModel objects are not.",
    [Markup(MarkupType.bold, 183, 197)],
  ),
  Paragraph(
    ParagraphType.text,
    "AndroidViewModel is a subclass of ViewModel that is aware of the Application context. However, having access to a context can be dangerous if you’re not observing or reacting to the lifecycle of that context. The recommended practice is to avoid dealing with objects that have a lifecycle in ViewModels.",
    [
      Markup(MarkupType.code, 0, 16),
      Markup(MarkupType.code, 34, 43),
      Markup(MarkupType.bold, 209, 303)
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "Let’s look at an example based on this issue in the tracker: Updating ViewModel on system locale change.",
    [
      Markup(
        MarkupType.link,
        61,
        103,
        "https://issuetracker.google.com/issues/111961971",
      ),
      Markup(MarkupType.italic, 61, 104)
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "The problem is that the string is resolved in the constructor only once. If there’s a locale change, the ViewModel won’t be recreated. This will result in our app showing obsolete data and therefore being only partially localized.",
    [Markup(MarkupType.bold, 73, 133)],
  ),
  Paragraph(
    ParagraphType.text,
    "As Sergey points out in the comments to the issue, the recommended approach is to expose the ID of the resource you want to load and do so in the view. As the view (activity, fragment, etc.) is lifecycle-aware it will be recreated after a configuration change so the resource will be reloaded correctly.",
    [
      Markup(MarkupType.link, 3, 9, "https://twitter.com/ZelenetS"),
      Markup(
        MarkupType.link,
        28,
        36,
        "https://issuetracker.google.com/issues/111961971#comment2",
      ),
      Markup(MarkupType.bold, 82, 150)
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "Even if you don’t plan to localize your app, it makes testing much easier and cleans up your ViewModel objects so there’s no reason not to future-proof.",
  ),
  Paragraph(
    ParagraphType.text,
    "We fixed this issue in the android-architecture repository in the Java and Kotlin branches and we offloaded resource loading to the Data Binding layout.",
    [
      Markup(
        MarkupType.link,
        66,
        70,
        "https://github.com/googlesamples/android-architecture/pull/631",
      ),
      Markup(
        MarkupType.link,
        75,
        81,
        "https://github.com/googlesamples/android-architecture/pull/635",
      ),
      Markup(
        MarkupType.link,
        128,
        151,
        "https://github.com/googlesamples/android-architecture/pull/635/files#diff-7eb5d85ec3ea4e05ecddb7dc8ae20aa1R62",
      )
    ],
  )
];
var paragraphsPost5 = [
  Paragraph(
    ParagraphType.text,
    "Working with collections is a common task and the Kotlin Standard Library offers many great utility functions. It also offers two ways of working with collections based on how they’re evaluated: eagerly — with Collections, and lazily — with Sequences. Continue reading to find out what’s the difference between the two, which one you should use and when, and what the performance implications of each are.",
    [
      Markup(MarkupType.code, 210, 220),
      Markup(MarkupType.code, 241, 249),
      Markup(
        MarkupType.link,
        210,
        221,
        "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/index.html",
      ),
      Markup(
        MarkupType.link,
        241,
        250,
        "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.sequences/index.html",
      ),
      Markup(MarkupType.bold, 130, 134),
      Markup(MarkupType.bold, 195, 202),
      Markup(MarkupType.bold, 227, 233),
      Markup(MarkupType.italic, 130, 134)
    ],
  ),
  Paragraph(ParagraphType.header, "Collections vs sequences"),
  Paragraph(
    ParagraphType.text,
    "The difference between eager and lazy evaluation lies in when each transformation on the collection is performed.",
    [Markup(MarkupType.italic, 57, 61)],
  ),
  Paragraph(
    ParagraphType.text,
    "Collections are eagerly evaluated — each operation is performed when it’s called and the result of the operation is stored in a new collection. The transformations on collections are inline functions. For example, looking at how map is implemented, we can see that it’s an inline function, that creates a new ArrayList:",
    [
      Markup(MarkupType.code, 229, 232),
      Markup(MarkupType.code, 273, 279),
      Markup(MarkupType.code, 309, 318),
      Markup(
        MarkupType.link,
        183,
        199,
        "https://kotlinlang.org/docs/reference/inline-functions.html",
      ),
      Markup(
        MarkupType.link,
        229,
        232,
        "https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/common/src/generated/_Collections.kt#L1312",
      ),
      Markup(MarkupType.bold, 0, 12),
      Markup(MarkupType.italic, 16, 23)
    ],
  ),
  Paragraph(
    ParagraphType.codeBlock,
    "public inline fun <T, R> Iterable<T>.map(transform: (T) -> R): List<R> {\n" +
        "  return mapTo(ArrayList<R>(collectionSizeOrDefault(10)],, transform)\n" +
        "}",
    [Markup(MarkupType.bold, 7, 13), Markup(MarkupType.bold, 88, 97)],
  ),
  Paragraph(
    ParagraphType.text,
    "Sequences are lazily evaluated. They have two types of operations: intermediate and terminal. Intermediate operations are not performed on the spot; they’re just stored. Only when a terminal operation is called, the intermediate operations are triggered on each element in a row and finally, the terminal operation is applied. Intermediate operations (like map, distinct, groupBy etc) return another sequence whereas terminal operations (like first, toList, count etc) don’t.",
    [
      Markup(MarkupType.code, 357, 360),
      Markup(MarkupType.code, 362, 370),
      Markup(MarkupType.code, 372, 379),
      Markup(MarkupType.code, 443, 448),
      Markup(MarkupType.code, 450, 456),
      Markup(MarkupType.code, 458, 463),
      Markup(MarkupType.bold, 0, 9),
      Markup(MarkupType.bold, 67, 79),
      Markup(MarkupType.bold, 84, 92),
      Markup(MarkupType.bold, 254, 269),
      Markup(MarkupType.italic, 14, 20)
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "Sequences don’t hold a reference to the items of the collection. They’re created based on the iterator of the original collection and keep a reference to all the intermediate operations that need to be performed.",
  ),
  Paragraph(
    ParagraphType.text,
    "Unlike transformations on collections, intermediate transformations on sequences are not inline functions — inline functions cannot be stored and sequences need to store them. Looking at how an intermediate operation like map is implemented, we can see that the transform function is kept in a new instance of a Sequence:",
    [
      Markup(MarkupType.code, 222, 225),
      Markup(MarkupType.code, 312, 320),
      Markup(
        MarkupType.link,
        222,
        225,
        "https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/common/src/generated/_Sequences.kt#L860",
      )
    ],
  ),
  Paragraph(
    ParagraphType.codeBlock,
    "public fun <T, R> Sequence<T>.map(transform: (T) -> R): Sequence<R>{      \n" +
        "   return TransformingSequence(this, transform)\n" +
        "}",
    [Markup(MarkupType.bold, 85, 105)],
  ),
  Paragraph(
    ParagraphType.text,
    "A terminal operation, like first, iterates through the elements of the sequence until the predicate condition is matched.",
    [
      Markup(MarkupType.code, 27, 32),
      Markup(
        MarkupType.link,
        27,
        32,
        "https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/common/src/generated/_Sequences.kt#L117",
      )
    ],
  ),
  Paragraph(
    ParagraphType.codeBlock,
    "public inline fun <T> Sequence<T>.first(predicate: (T) -> Boolean): T {\n" +
        "   for (element in this) if (predicate(element)], return element\n" +
        "   throw NoSuchElementException(“Sequence contains no element matching the predicate.”)\n" +
        "}",
  ),
  Paragraph(
    ParagraphType.text,
    "If we look at how a sequence like TransformingSequence (used in the map above) is implemented, we’ll see that when next is called on the sequence iterator, the transformation stored is also applied.",
    [Markup(MarkupType.code, 34, 54), Markup(MarkupType.code, 68, 71)],
  ),
  Paragraph(
    ParagraphType.codeBlock,
    "internal class TransformingIndexedSequence<T, R> \n" +
        "constructor(private var sequence: Sequence<T>, private var transformer: (Int, T) -> R) : Sequence<R> {",
    [Markup(MarkupType.bold, 109, 120)],
  ),
  Paragraph(
    ParagraphType.codeBlock,
    "override fun iterator(): Iterator<R> = object : Iterator<R> {\n" +
        "   …\n" +
        "   override fun next(): R {\n" +
        "     return transformer(checkIndexOverflow(index++), iterator.next()],\n" +
        "   }\n" +
        "   …\n" +
        "}",
    [Markup(MarkupType.bold, 83, 89), Markup(MarkupType.bold, 107, 118)],
  ),
  Paragraph(
    ParagraphType.text,
    "Independent on whether you’re using collections or sequences, the Kotlin Standard Library offers quite a wide range of operations for both, like find, filter, groupBy and others. Make sure you check them out, before implementing your own version of these.",
    [
      Markup(MarkupType.code, 145, 149),
      Markup(MarkupType.code, 151, 157),
      Markup(MarkupType.code, 159, 166),
      Markup(
        MarkupType.link,
        193,
        207,
        "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/#functions",
      )
    ],
  ),
  Paragraph(ParagraphType.header, "Collections and sequences"),
  Paragraph(
    ParagraphType.text,
    "Let’s say that we have a list of objects of different shapes. We want to make the shapes yellow and then take the first square shape.",
  ),
  Paragraph(
    ParagraphType.text,
    "Let’s see how and when each operation is applied for collections and when for sequences",
  ),
  Paragraph(ParagraphType.subhead, "Collections"),
  Paragraph(
    ParagraphType.text,
    "map is called — a new ArrayList is created. We iterate through all items of the initial collection, transform it by copying the original object and changing the color, then add it to the new list.",
    [Markup(MarkupType.code, 0, 3)],
  ),
  Paragraph(
    ParagraphType.text,
    "first is called — we iterate through each item until the first square is found",
    [Markup(MarkupType.code, 0, 5)],
  ),
  Paragraph(ParagraphType.subhead, "Sequences"),
  Paragraph(
    ParagraphType.bullet,
    "asSequence — a sequence is created based on the Iterator of the original collection",
    [Markup(MarkupType.code, 0, 10)],
  ),
  Paragraph(
    ParagraphType.bullet,
    "map is called — the transformation is added to the list of operations needed to be performed by the sequence but the operation is NOT performed",
    [Markup(MarkupType.code, 0, 3), Markup(MarkupType.bold, 130, 133)],
  ),
  Paragraph(
    ParagraphType.bullet,
    "first is called — this is a terminal operation, so, all the intermediate operations are triggered, on each element of the collection. We iterate through the initial collection applying map and then first on each of them. Since the condition from first is satisfied by the 2nd element, then we no longer apply the map on the rest of the collection.",
    [Markup(MarkupType.code, 0, 5)],
  ),
  Paragraph(
    ParagraphType.text,
    "When working with sequences no intermediate collection is created and since items are evaluated one by one, map is only performed on some of the inputs.",
  ),
  Paragraph(ParagraphType.header, "Performance"),
  Paragraph(ParagraphType.subhead, "Order of transformations"),
  Paragraph(
    ParagraphType.text,
    "Independent of whether you’re using collections or sequences, the order of transformations matters. In the example above, first doesn’t need to happen after map since it’s not a consequence of the map transformation. If we reverse the order of our business logic and call first on the collection and then transform the result, then we only create one new object — the yellow square. When using sequences — we avoid creating 2 new objects, when using collections, we avoid creating an entire new list.",
    [
      Markup(MarkupType.code, 122, 127),
      Markup(MarkupType.code, 157, 160),
      Markup(MarkupType.code, 197, 200)
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "Because terminal operations can finish processing early, and intermediate operations are evaluated lazily, sequences can, in some cases, help you avoid doing unnecessary work compared to collections. Make sure you always check the order of the transformations and the dependencies between them!",
  ),
  Paragraph(ParagraphType.subhead, "Inlining and large data sets consequences"),
  Paragraph(
    ParagraphType.text,
    "Collection operations use inline functions, so the bytecode of the operation, together with the bytecode of the lambda passed to it will be inlined. Sequences don’t use inline functions, therefore, new Function objects are created for each operation.",
    [Markup(MarkupType.code, 202, 210)],
  ),
  Paragraph(
    ParagraphType.text,
    "On the other hand, collections create a new list for every transformation while sequences just keep a reference to the transformation function.",
  ),
  Paragraph(
    ParagraphType.text,
    "When working with small collections, with 1–2 operators, these differences don’t have big implications so working with collections should be ok. But, when working with large lists the intermediate collection creation can become expensive; in such cases, use sequences.",
    [
      Markup(MarkupType.bold, 18, 35),
      Markup(MarkupType.bold, 119, 130),
      Markup(MarkupType.bold, 168, 179),
      Markup(MarkupType.bold, 258, 267)
    ],
  ),
  Paragraph(
    ParagraphType.text,
    "Unfortunately, I’m not aware of any benchmarking study done that would help us get a better understanding on how the performance of collections vs sequences is affected with different sizes of collections or operation chains.",
  ),
  Paragraph(
    ParagraphType.text,
    "Collections eagerly evaluate your data while sequences do so lazily. Depending on the size of your data, pick the one that fits best: collections — for small lists or sequences — for larger ones, and pay attention to the order of the transformations.",
  ),
];

var post1 = Post(
  "dc523f0ed25c",
  "A Little Thing about Android Module Paths",
  "How to configure your module paths, instead of using Gradle’s default.",
  "https://medium.com/androiddevelopers/gradle-path-configuration-dc523f0ed25c",
  publication,
  Metadata(pietro, "August 02", 1),
  paragraphsPost1,
);

var post2 = Post(
  "7446d8dfd7dc",
  "Dagger in Kotlin: Gotchas and Optimizations",
  "Use Dagger in Kotlin! This article includes best practices to optimize your build time and gotchas you might encounter.",
  "https://medium.com/androiddevelopers/dagger-in-kotlin-gotchas-and-optimizations-7446d8dfd7dc",
  publication,
  Metadata(manuel, "July 30", 3),
  paragraphsPost2,
);

var post3 = Post(
  "ac552dcc1741",
  "From Java Programming Language to Kotlin — the idiomatic way",
  "Learn how to get started converting Java Programming Language code to Kotlin, making it more idiomatic and avoid common pitfalls, by…",
  "https://medium.com/androiddevelopers/from-java-programming-language-to-kotlin-the-idiomatic-way-ac552dcc1741",
  publication,
  Metadata(florina, "July 09", 1),
  paragraphsPost3,
);

var post4 = Post(
  "84eb677660d9",
  "Locale changes and the AndroidViewModel antipattern",
  "TL;DR: Expose resource IDs from ViewModels to avoid showing obsolete data.",
  "https://medium.com/androiddevelopers/locale-changes-and-the-androidviewmodel-antipattern-84eb677660d9",
  publication,
  Metadata(jose, "April 02", 1),
  paragraphsPost4,
);

var post5 = Post(
  "55db18283aca",
  "Collections and sequences in Kotlin",
  "Working with collections is a common task and the Kotlin Standard Library offers many great utility functions. It also offers two ways of…",
  "https://medium.com/androiddevelopers/collections-and-sequences-in-kotlin-55db18283aca",
  publication,
  Metadata(florina, "July 24", 4),
  paragraphsPost5,
);

var post6 = Post(
  "post6",
  "A Little Thing about Android Module Paths",
  "How to configure your module paths, instead of using Gradle’s default.",
  "https://medium.com/androiddevelopers/gradle-path-configuration-dc523f0ed25c",
  publication,
  Metadata(pietro, "August 02", 1),
  paragraphsPost1,
);

var post7 = Post(
  "post7",
  "Dagger in Kotlin: Gotchas and Optimizations",
  "Use Dagger in Kotlin! This article includes best practices to optimize your build time and gotchas you might encounter.",
  "https://medium.com/androiddevelopers/dagger-in-kotlin-gotchas-and-optimizations-7446d8dfd7dc",
  publication,
  Metadata(manuel, "July 30", 3),
  paragraphsPost2,
);

var post8 = Post(
  "post8",
  "From Java Programming Language to Kotlin — the idiomatic way",
  "Learn how to get started converting Java Programming Language code to Kotlin, making it more idiomatic and avoid common pitfalls, by…",
  "https://medium.com/androiddevelopers/from-java-programming-language-to-kotlin-the-idiomatic-way-ac552dcc1741",
  publication,
  Metadata(florina, "July 09", 1),
  paragraphsPost3,
);

var post9 = Post(
  "post9",
  "Locale changes and the AndroidViewModel antipattern",
  "TL;DR: Expose resource IDs from ViewModels to avoid showing obsolete data.",
  "https://medium.com/androiddevelopers/locale-changes-and-the-androidviewmodel-antipattern-84eb677660d9",
  publication,
  Metadata(jose, "April 02", 1),
  paragraphsPost4,
);

var post10 = Post(
  "post10",
  "Collections and sequences in Kotlin",
  "Working with collections is a common task and the Kotlin Standard Library offers many great utility functions. It also offers two ways of…",
  "https://medium.com/androiddevelopers/collections-and-sequences-in-kotlin-55db18283aca",
  publication,
  Metadata(florina, "July 24", 4),
  paragraphsPost5,
);

var posts = PostFeed(
  highlightedPost: post4,
  recommendedPosts: [post1, post2, post3],
  popularPosts: [post5, post6, post7],
  recentPosts: [post8, post9, post10],
);
