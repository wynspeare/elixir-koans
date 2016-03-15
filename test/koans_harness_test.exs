defmodule KoansHarnessTest do
  use ExUnit.Case

  test "Equalities" do
    answers = [true,
               1,
               2,
               1,
               :something]

    test_all(Equalities, answers)
  end

  test "Lists" do
    answers = [1,
               3,
               [1,2,:a,"b"],
               [1,2],
               [1,2,3],
               [1,3],
               ["life", "life", "life"],
               [1, 2, 3, 4, 5],
               [1, 2, 3, 4],
               [1, 4, 2, 3],
               [10, 2, 3],
               [1, 2, 3],
               [1, 2, 3, 4],
               [1, 2, 3, 4],
               {1, 2, 3},
               ["value"],
               [{1, 3, 5}, {2, 4, 6}]
               ]

    test_all(Lists, answers)
  end

  test "Maps" do
    answers = [
      "Jon",
      [:age, :last_name, :name],
      [27, "Snow", "Jon"],
      {:ok, 27},
      :error,
      %{ :name => "Jon", :last_name => "Snow", :age => 27 },
      %{ :name => "Jon", :last_name => "Snow", :age => 27 },
      %{ :name => "Jon", :last_name => "Snow", :age => 27 },
      %{ :name => "Jon", :last_name => "Snow"},
      %{ :name => "Jon", :last_name => "Snow", :age => 27 },
      [age: 27, last_name: "Snow", name: "Jon" ],
      %{:name => "Jon", :last_name => "Snow"},
      %{:name => "Robert", :last_name => "Baratheon"},
      %{ :name => "Jon", :last_name => "Snow"}
    ]

    test_all(Maps, answers)
  end

  test "String" do
    answers = [
      "hello",
      "hello ",
      ["hello", "world"],
      "An awful day",
      "incredible",
      "banana",
      "banana",
      "String",
      "listen"
    ]

    test_all(Strings, answers)
  end

  test "Functions" do
    answers = [
      :light,
      3,
      :it_was_truthy,
      "It really wasn't",
      "Hello Hello Hello ",
      "Hello Hello Hello Hello Hello ",
      "One and Two",
      "only One",
      :entire_list,
      :single_thing,
      "10 is bigger than 5",
      "4 is not bigger than 27",
      "It was zero",
      "The length was 5",
      6,
      6,
      "the other one",
      100,
      "Full Name"
    ]

    test_all(Functions, answers)
  end

  test "Enum" do
    answers = [
      4,
      4,
      4,
      true,
      false,
      true,
      false,
      true,
      false,
      [10,20,30],
      [false, true, false],
      [1,2,3],
      [1,3],
      [2],
      [1,2,3],
      [1,2,3,4,5],
      [1,2,3],
      [1,2,3],
      [1,2,3],
      %{ :odd => [3,1], :even => [4,2] },
      %{ 0 => [6, 3], 1 => [4, 1], 2 => [5, 2]},
      [{1, :a}, {2, :b}, {3, :c}],
      [{1, :a}, {2, :b}, {3, :c}],
      2,
      nil,
      :no_such_element,
      6
    ]

    test_all(Enums, answers)
  end

  test "Arithmetic" do
    answers = [
      4,
      3,
      12,
      3,
      3,
      2.5,
      2,
      1,
      4,
      1,
      2
    ]

    test_all(Arithmetic, answers)
  end

  test "Structs" do
    answers = [
      nil,
      "Joe",
      33,
      23,
      22,
      true,
      22,
    ]

    test_all(Structs, answers)
  end

  def test_all(module, answers) do
    module.all_koans
    |> Enum.zip(answers)
    |> run_all(module)
  end

  def run_all(pairs, module) do
    Enum.map(pairs, fn ({koan, answer}) -> Runner.run_koan(module, koan, [answer]) end)
  end
end
