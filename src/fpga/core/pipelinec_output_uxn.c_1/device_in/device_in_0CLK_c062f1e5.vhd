-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 22
entity device_in_0CLK_c062f1e5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 stack_ptr0 : in unsigned(7 downto 0);
 stack_ptr1 : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end device_in_0CLK_c062f1e5;
architecture arch of device_in_0CLK_c062f1e5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal device : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : device_in_result_t := (
device_ram_address => to_unsigned(0, 8),
dei_value => to_unsigned(0, 8),
is_dei_done => to_unsigned(0, 1))
;
signal REG_COMB_device : unsigned(7 downto 0);
signal REG_COMB_result : device_in_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_device_h_l609_c11_278b]
signal BIN_OP_AND_uxn_device_h_l609_c11_278b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l609_c11_278b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l609_c11_278b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l611_c6_29dd]
signal BIN_OP_EQ_uxn_device_h_l611_c6_29dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l611_c6_29dd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l611_c6_29dd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l611_c1_a6a1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l614_c7_abcf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l611_c2_8913]
signal result_MUX_uxn_device_h_l611_c2_8913_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l611_c2_8913_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l611_c2_8913_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l611_c2_8913_return_output : device_in_result_t;

-- system_dei[uxn_device_h_l612_c12_229a]
signal system_dei_uxn_device_h_l612_c12_229a_CLOCK_ENABLE : unsigned(0 downto 0);
signal system_dei_uxn_device_h_l612_c12_229a_device_address : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l612_c12_229a_phase : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l612_c12_229a_stack_ptr0 : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l612_c12_229a_stack_ptr1 : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l612_c12_229a_previous_device_ram_read : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l612_c12_229a_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l614_c11_bed9]
signal BIN_OP_EQ_uxn_device_h_l614_c11_bed9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l614_c11_bed9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l614_c11_bed9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l614_c1_7c76]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l617_c7_2d7a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l614_c7_abcf]
signal result_MUX_uxn_device_h_l614_c7_abcf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l614_c7_abcf_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l614_c7_abcf_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l614_c7_abcf_return_output : device_in_result_t;

-- screen_dei[uxn_device_h_l615_c12_838d]
signal screen_dei_uxn_device_h_l615_c12_838d_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l615_c12_838d_device_address : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l615_c12_838d_phase : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l615_c12_838d_previous_device_ram_read : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l615_c12_838d_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l617_c11_8c50]
signal BIN_OP_EQ_uxn_device_h_l617_c11_8c50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l617_c11_8c50_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l617_c11_8c50_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l617_c1_c5ec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l620_c7_fb20]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l617_c7_2d7a]
signal result_MUX_uxn_device_h_l617_c7_2d7a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l617_c7_2d7a_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l617_c7_2d7a_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l617_c7_2d7a_return_output : device_in_result_t;

-- controller_dei[uxn_device_h_l618_c12_b729]
signal controller_dei_uxn_device_h_l618_c12_b729_CLOCK_ENABLE : unsigned(0 downto 0);
signal controller_dei_uxn_device_h_l618_c12_b729_device_address : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l618_c12_b729_phase : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l618_c12_b729_controller0_buttons : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l618_c12_b729_previous_device_ram_read : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l618_c12_b729_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l620_c11_ecff]
signal BIN_OP_EQ_uxn_device_h_l620_c11_ecff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l620_c11_ecff_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l620_c11_ecff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l620_c1_3723]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l623_c1_fa28]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l620_c7_fb20]
signal result_MUX_uxn_device_h_l620_c7_fb20_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l620_c7_fb20_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l620_c7_fb20_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l620_c7_fb20_return_output : device_in_result_t;

-- datetime_dei[uxn_device_h_l621_c12_86a0]
signal datetime_dei_uxn_device_h_l621_c12_86a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal datetime_dei_uxn_device_h_l621_c12_86a0_device_address : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l621_c12_86a0_phase : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l621_c12_86a0_previous_device_ram_read : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l621_c12_86a0_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l624_c12_ead4]
signal generic_dei_uxn_device_h_l624_c12_ead4_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l624_c12_ead4_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l624_c12_ead4_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l624_c12_ead4_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l624_c12_ead4_return_output : device_in_result_t;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l609_c11_278b
BIN_OP_AND_uxn_device_h_l609_c11_278b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l609_c11_278b_left,
BIN_OP_AND_uxn_device_h_l609_c11_278b_right,
BIN_OP_AND_uxn_device_h_l609_c11_278b_return_output);

-- BIN_OP_EQ_uxn_device_h_l611_c6_29dd
BIN_OP_EQ_uxn_device_h_l611_c6_29dd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l611_c6_29dd_left,
BIN_OP_EQ_uxn_device_h_l611_c6_29dd_right,
BIN_OP_EQ_uxn_device_h_l611_c6_29dd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_return_output);

-- result_MUX_uxn_device_h_l611_c2_8913
result_MUX_uxn_device_h_l611_c2_8913 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l611_c2_8913_cond,
result_MUX_uxn_device_h_l611_c2_8913_iftrue,
result_MUX_uxn_device_h_l611_c2_8913_iffalse,
result_MUX_uxn_device_h_l611_c2_8913_return_output);

-- system_dei_uxn_device_h_l612_c12_229a
system_dei_uxn_device_h_l612_c12_229a : entity work.system_dei_0CLK_5e0132c5 port map (
clk,
system_dei_uxn_device_h_l612_c12_229a_CLOCK_ENABLE,
system_dei_uxn_device_h_l612_c12_229a_device_address,
system_dei_uxn_device_h_l612_c12_229a_phase,
system_dei_uxn_device_h_l612_c12_229a_stack_ptr0,
system_dei_uxn_device_h_l612_c12_229a_stack_ptr1,
system_dei_uxn_device_h_l612_c12_229a_previous_device_ram_read,
system_dei_uxn_device_h_l612_c12_229a_return_output);

-- BIN_OP_EQ_uxn_device_h_l614_c11_bed9
BIN_OP_EQ_uxn_device_h_l614_c11_bed9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l614_c11_bed9_left,
BIN_OP_EQ_uxn_device_h_l614_c11_bed9_right,
BIN_OP_EQ_uxn_device_h_l614_c11_bed9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_return_output);

-- result_MUX_uxn_device_h_l614_c7_abcf
result_MUX_uxn_device_h_l614_c7_abcf : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l614_c7_abcf_cond,
result_MUX_uxn_device_h_l614_c7_abcf_iftrue,
result_MUX_uxn_device_h_l614_c7_abcf_iffalse,
result_MUX_uxn_device_h_l614_c7_abcf_return_output);

-- screen_dei_uxn_device_h_l615_c12_838d
screen_dei_uxn_device_h_l615_c12_838d : entity work.screen_dei_0CLK_d7085478 port map (
clk,
screen_dei_uxn_device_h_l615_c12_838d_CLOCK_ENABLE,
screen_dei_uxn_device_h_l615_c12_838d_device_address,
screen_dei_uxn_device_h_l615_c12_838d_phase,
screen_dei_uxn_device_h_l615_c12_838d_previous_device_ram_read,
screen_dei_uxn_device_h_l615_c12_838d_return_output);

-- BIN_OP_EQ_uxn_device_h_l617_c11_8c50
BIN_OP_EQ_uxn_device_h_l617_c11_8c50 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l617_c11_8c50_left,
BIN_OP_EQ_uxn_device_h_l617_c11_8c50_right,
BIN_OP_EQ_uxn_device_h_l617_c11_8c50_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_return_output);

-- result_MUX_uxn_device_h_l617_c7_2d7a
result_MUX_uxn_device_h_l617_c7_2d7a : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l617_c7_2d7a_cond,
result_MUX_uxn_device_h_l617_c7_2d7a_iftrue,
result_MUX_uxn_device_h_l617_c7_2d7a_iffalse,
result_MUX_uxn_device_h_l617_c7_2d7a_return_output);

-- controller_dei_uxn_device_h_l618_c12_b729
controller_dei_uxn_device_h_l618_c12_b729 : entity work.controller_dei_0CLK_336c9a77 port map (
clk,
controller_dei_uxn_device_h_l618_c12_b729_CLOCK_ENABLE,
controller_dei_uxn_device_h_l618_c12_b729_device_address,
controller_dei_uxn_device_h_l618_c12_b729_phase,
controller_dei_uxn_device_h_l618_c12_b729_controller0_buttons,
controller_dei_uxn_device_h_l618_c12_b729_previous_device_ram_read,
controller_dei_uxn_device_h_l618_c12_b729_return_output);

-- BIN_OP_EQ_uxn_device_h_l620_c11_ecff
BIN_OP_EQ_uxn_device_h_l620_c11_ecff : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l620_c11_ecff_left,
BIN_OP_EQ_uxn_device_h_l620_c11_ecff_right,
BIN_OP_EQ_uxn_device_h_l620_c11_ecff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_return_output);

-- result_MUX_uxn_device_h_l620_c7_fb20
result_MUX_uxn_device_h_l620_c7_fb20 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l620_c7_fb20_cond,
result_MUX_uxn_device_h_l620_c7_fb20_iftrue,
result_MUX_uxn_device_h_l620_c7_fb20_iffalse,
result_MUX_uxn_device_h_l620_c7_fb20_return_output);

-- datetime_dei_uxn_device_h_l621_c12_86a0
datetime_dei_uxn_device_h_l621_c12_86a0 : entity work.datetime_dei_0CLK_24541ec2 port map (
clk,
datetime_dei_uxn_device_h_l621_c12_86a0_CLOCK_ENABLE,
datetime_dei_uxn_device_h_l621_c12_86a0_device_address,
datetime_dei_uxn_device_h_l621_c12_86a0_phase,
datetime_dei_uxn_device_h_l621_c12_86a0_previous_device_ram_read,
datetime_dei_uxn_device_h_l621_c12_86a0_return_output);

-- generic_dei_uxn_device_h_l624_c12_ead4
generic_dei_uxn_device_h_l624_c12_ead4 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l624_c12_ead4_CLOCK_ENABLE,
generic_dei_uxn_device_h_l624_c12_ead4_device_address,
generic_dei_uxn_device_h_l624_c12_ead4_phase,
generic_dei_uxn_device_h_l624_c12_ead4_previous_device_ram_read,
generic_dei_uxn_device_h_l624_c12_ead4_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 controller0_buttons,
 stack_ptr0,
 stack_ptr1,
 previous_device_ram_read,
 -- Registers
 device,
 result,
 -- All submodule outputs
 BIN_OP_AND_uxn_device_h_l609_c11_278b_return_output,
 BIN_OP_EQ_uxn_device_h_l611_c6_29dd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_return_output,
 result_MUX_uxn_device_h_l611_c2_8913_return_output,
 system_dei_uxn_device_h_l612_c12_229a_return_output,
 BIN_OP_EQ_uxn_device_h_l614_c11_bed9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_return_output,
 result_MUX_uxn_device_h_l614_c7_abcf_return_output,
 screen_dei_uxn_device_h_l615_c12_838d_return_output,
 BIN_OP_EQ_uxn_device_h_l617_c11_8c50_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_return_output,
 result_MUX_uxn_device_h_l617_c7_2d7a_return_output,
 controller_dei_uxn_device_h_l618_c12_b729_return_output,
 BIN_OP_EQ_uxn_device_h_l620_c11_ecff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_return_output,
 result_MUX_uxn_device_h_l620_c7_fb20_return_output,
 datetime_dei_uxn_device_h_l621_c12_86a0_return_output,
 generic_dei_uxn_device_h_l624_c12_ead4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l609_c11_278b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l609_c11_278b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l609_c11_278b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l611_c6_29dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l611_c6_29dd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l611_c6_29dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l611_c2_8913_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l611_c2_8913_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l614_c7_abcf_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l611_c2_8913_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l611_c2_8913_cond : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l612_c12_229a_device_address : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l612_c12_229a_phase : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l612_c12_229a_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l612_c12_229a_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l612_c12_229a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l612_c12_229a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l612_c12_229a_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l614_c11_bed9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l614_c11_bed9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l614_c11_bed9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l614_c7_abcf_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l614_c7_abcf_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l617_c7_2d7a_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l614_c7_abcf_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l615_c12_838d_device_address : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l615_c12_838d_phase : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l615_c12_838d_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l615_c12_838d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l615_c12_838d_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l617_c11_8c50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l617_c11_8c50_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l617_c11_8c50_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l617_c7_2d7a_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l617_c7_2d7a_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l620_c7_fb20_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l617_c7_2d7a_cond : unsigned(0 downto 0);
 variable VAR_controller_dei_uxn_device_h_l618_c12_b729_device_address : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l618_c12_b729_phase : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l618_c12_b729_controller0_buttons : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l618_c12_b729_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l618_c12_b729_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_controller_dei_uxn_device_h_l618_c12_b729_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l620_c11_ecff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l620_c11_ecff_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l620_c11_ecff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l620_c7_fb20_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l620_c7_fb20_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l620_c7_fb20_cond : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l621_c12_86a0_device_address : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l621_c12_86a0_phase : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l621_c12_86a0_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l621_c12_86a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l621_c12_86a0_return_output : device_in_result_t;
 variable VAR_generic_dei_uxn_device_h_l624_c12_ead4_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l624_c12_ead4_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l624_c12_ead4_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l624_c12_ead4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l624_c12_ead4_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_device : unsigned(7 downto 0);
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_device := device;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l614_c11_bed9_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l617_c11_8c50_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l611_c6_29dd_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l620_c11_ecff_right := to_unsigned(192, 8);
     VAR_BIN_OP_AND_uxn_device_h_l609_c11_278b_right := to_unsigned(240, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_controller0_buttons := controller0_buttons;
     VAR_stack_ptr0 := stack_ptr0;
     VAR_stack_ptr1 := stack_ptr1;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_iftrue := VAR_CLOCK_ENABLE;
     VAR_controller_dei_uxn_device_h_l618_c12_b729_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_AND_uxn_device_h_l609_c11_278b_left := VAR_device_address;
     VAR_controller_dei_uxn_device_h_l618_c12_b729_device_address := VAR_device_address;
     VAR_datetime_dei_uxn_device_h_l621_c12_86a0_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l624_c12_ead4_device_address := VAR_device_address;
     VAR_screen_dei_uxn_device_h_l615_c12_838d_device_address := VAR_device_address;
     VAR_system_dei_uxn_device_h_l612_c12_229a_device_address := VAR_device_address;
     VAR_controller_dei_uxn_device_h_l618_c12_b729_phase := VAR_phase;
     VAR_datetime_dei_uxn_device_h_l621_c12_86a0_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l624_c12_ead4_phase := VAR_phase;
     VAR_screen_dei_uxn_device_h_l615_c12_838d_phase := VAR_phase;
     VAR_system_dei_uxn_device_h_l612_c12_229a_phase := VAR_phase;
     VAR_controller_dei_uxn_device_h_l618_c12_b729_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_datetime_dei_uxn_device_h_l621_c12_86a0_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_generic_dei_uxn_device_h_l624_c12_ead4_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_screen_dei_uxn_device_h_l615_c12_838d_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_system_dei_uxn_device_h_l612_c12_229a_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_system_dei_uxn_device_h_l612_c12_229a_stack_ptr0 := VAR_stack_ptr0;
     VAR_system_dei_uxn_device_h_l612_c12_229a_stack_ptr1 := VAR_stack_ptr1;
     -- BIN_OP_AND[uxn_device_h_l609_c11_278b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l609_c11_278b_left <= VAR_BIN_OP_AND_uxn_device_h_l609_c11_278b_left;
     BIN_OP_AND_uxn_device_h_l609_c11_278b_right <= VAR_BIN_OP_AND_uxn_device_h_l609_c11_278b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l609_c11_278b_return_output := BIN_OP_AND_uxn_device_h_l609_c11_278b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l611_c6_29dd_left := VAR_BIN_OP_AND_uxn_device_h_l609_c11_278b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l614_c11_bed9_left := VAR_BIN_OP_AND_uxn_device_h_l609_c11_278b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l617_c11_8c50_left := VAR_BIN_OP_AND_uxn_device_h_l609_c11_278b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l620_c11_ecff_left := VAR_BIN_OP_AND_uxn_device_h_l609_c11_278b_return_output;
     REG_VAR_device := VAR_BIN_OP_AND_uxn_device_h_l609_c11_278b_return_output;
     -- BIN_OP_EQ[uxn_device_h_l611_c6_29dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l611_c6_29dd_left <= VAR_BIN_OP_EQ_uxn_device_h_l611_c6_29dd_left;
     BIN_OP_EQ_uxn_device_h_l611_c6_29dd_right <= VAR_BIN_OP_EQ_uxn_device_h_l611_c6_29dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l611_c6_29dd_return_output := BIN_OP_EQ_uxn_device_h_l611_c6_29dd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l614_c11_bed9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l614_c11_bed9_left <= VAR_BIN_OP_EQ_uxn_device_h_l614_c11_bed9_left;
     BIN_OP_EQ_uxn_device_h_l614_c11_bed9_right <= VAR_BIN_OP_EQ_uxn_device_h_l614_c11_bed9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l614_c11_bed9_return_output := BIN_OP_EQ_uxn_device_h_l614_c11_bed9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l620_c11_ecff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l620_c11_ecff_left <= VAR_BIN_OP_EQ_uxn_device_h_l620_c11_ecff_left;
     BIN_OP_EQ_uxn_device_h_l620_c11_ecff_right <= VAR_BIN_OP_EQ_uxn_device_h_l620_c11_ecff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l620_c11_ecff_return_output := BIN_OP_EQ_uxn_device_h_l620_c11_ecff_return_output;

     -- BIN_OP_EQ[uxn_device_h_l617_c11_8c50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l617_c11_8c50_left <= VAR_BIN_OP_EQ_uxn_device_h_l617_c11_8c50_left;
     BIN_OP_EQ_uxn_device_h_l617_c11_8c50_right <= VAR_BIN_OP_EQ_uxn_device_h_l617_c11_8c50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l617_c11_8c50_return_output := BIN_OP_EQ_uxn_device_h_l617_c11_8c50_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_cond := VAR_BIN_OP_EQ_uxn_device_h_l611_c6_29dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_cond := VAR_BIN_OP_EQ_uxn_device_h_l611_c6_29dd_return_output;
     VAR_result_MUX_uxn_device_h_l611_c2_8913_cond := VAR_BIN_OP_EQ_uxn_device_h_l611_c6_29dd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l614_c11_bed9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_cond := VAR_BIN_OP_EQ_uxn_device_h_l614_c11_bed9_return_output;
     VAR_result_MUX_uxn_device_h_l614_c7_abcf_cond := VAR_BIN_OP_EQ_uxn_device_h_l614_c11_bed9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_cond := VAR_BIN_OP_EQ_uxn_device_h_l617_c11_8c50_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_cond := VAR_BIN_OP_EQ_uxn_device_h_l617_c11_8c50_return_output;
     VAR_result_MUX_uxn_device_h_l617_c7_2d7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l617_c11_8c50_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_cond := VAR_BIN_OP_EQ_uxn_device_h_l620_c11_ecff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_cond := VAR_BIN_OP_EQ_uxn_device_h_l620_c11_ecff_return_output;
     VAR_result_MUX_uxn_device_h_l620_c7_fb20_cond := VAR_BIN_OP_EQ_uxn_device_h_l620_c11_ecff_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l611_c1_a6a1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l614_c7_abcf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_abcf_return_output;
     VAR_system_dei_uxn_device_h_l612_c12_229a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_a6a1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l617_c7_2d7a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_return_output;

     -- system_dei[uxn_device_h_l612_c12_229a] LATENCY=0
     -- Clock enable
     system_dei_uxn_device_h_l612_c12_229a_CLOCK_ENABLE <= VAR_system_dei_uxn_device_h_l612_c12_229a_CLOCK_ENABLE;
     -- Inputs
     system_dei_uxn_device_h_l612_c12_229a_device_address <= VAR_system_dei_uxn_device_h_l612_c12_229a_device_address;
     system_dei_uxn_device_h_l612_c12_229a_phase <= VAR_system_dei_uxn_device_h_l612_c12_229a_phase;
     system_dei_uxn_device_h_l612_c12_229a_stack_ptr0 <= VAR_system_dei_uxn_device_h_l612_c12_229a_stack_ptr0;
     system_dei_uxn_device_h_l612_c12_229a_stack_ptr1 <= VAR_system_dei_uxn_device_h_l612_c12_229a_stack_ptr1;
     system_dei_uxn_device_h_l612_c12_229a_previous_device_ram_read <= VAR_system_dei_uxn_device_h_l612_c12_229a_previous_device_ram_read;
     -- Outputs
     VAR_system_dei_uxn_device_h_l612_c12_229a_return_output := system_dei_uxn_device_h_l612_c12_229a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l614_c1_7c76] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_2d7a_return_output;
     VAR_screen_dei_uxn_device_h_l615_c12_838d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7c76_return_output;
     VAR_result_MUX_uxn_device_h_l611_c2_8913_iftrue := VAR_system_dei_uxn_device_h_l612_c12_229a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l620_c7_fb20] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_return_output;

     -- screen_dei[uxn_device_h_l615_c12_838d] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l615_c12_838d_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l615_c12_838d_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l615_c12_838d_device_address <= VAR_screen_dei_uxn_device_h_l615_c12_838d_device_address;
     screen_dei_uxn_device_h_l615_c12_838d_phase <= VAR_screen_dei_uxn_device_h_l615_c12_838d_phase;
     screen_dei_uxn_device_h_l615_c12_838d_previous_device_ram_read <= VAR_screen_dei_uxn_device_h_l615_c12_838d_previous_device_ram_read;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l615_c12_838d_return_output := screen_dei_uxn_device_h_l615_c12_838d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l617_c1_c5ec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c7_fb20_return_output;
     VAR_controller_dei_uxn_device_h_l618_c12_b729_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_c5ec_return_output;
     VAR_result_MUX_uxn_device_h_l614_c7_abcf_iftrue := VAR_screen_dei_uxn_device_h_l615_c12_838d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l620_c1_3723] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l623_c1_fa28] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_return_output;

     -- controller_dei[uxn_device_h_l618_c12_b729] LATENCY=0
     -- Clock enable
     controller_dei_uxn_device_h_l618_c12_b729_CLOCK_ENABLE <= VAR_controller_dei_uxn_device_h_l618_c12_b729_CLOCK_ENABLE;
     -- Inputs
     controller_dei_uxn_device_h_l618_c12_b729_device_address <= VAR_controller_dei_uxn_device_h_l618_c12_b729_device_address;
     controller_dei_uxn_device_h_l618_c12_b729_phase <= VAR_controller_dei_uxn_device_h_l618_c12_b729_phase;
     controller_dei_uxn_device_h_l618_c12_b729_controller0_buttons <= VAR_controller_dei_uxn_device_h_l618_c12_b729_controller0_buttons;
     controller_dei_uxn_device_h_l618_c12_b729_previous_device_ram_read <= VAR_controller_dei_uxn_device_h_l618_c12_b729_previous_device_ram_read;
     -- Outputs
     VAR_controller_dei_uxn_device_h_l618_c12_b729_return_output := controller_dei_uxn_device_h_l618_c12_b729_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l624_c12_ead4_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l623_c1_fa28_return_output;
     VAR_datetime_dei_uxn_device_h_l621_c12_86a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_3723_return_output;
     VAR_result_MUX_uxn_device_h_l617_c7_2d7a_iftrue := VAR_controller_dei_uxn_device_h_l618_c12_b729_return_output;
     -- generic_dei[uxn_device_h_l624_c12_ead4] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l624_c12_ead4_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l624_c12_ead4_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l624_c12_ead4_device_address <= VAR_generic_dei_uxn_device_h_l624_c12_ead4_device_address;
     generic_dei_uxn_device_h_l624_c12_ead4_phase <= VAR_generic_dei_uxn_device_h_l624_c12_ead4_phase;
     generic_dei_uxn_device_h_l624_c12_ead4_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l624_c12_ead4_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l624_c12_ead4_return_output := generic_dei_uxn_device_h_l624_c12_ead4_return_output;

     -- datetime_dei[uxn_device_h_l621_c12_86a0] LATENCY=0
     -- Clock enable
     datetime_dei_uxn_device_h_l621_c12_86a0_CLOCK_ENABLE <= VAR_datetime_dei_uxn_device_h_l621_c12_86a0_CLOCK_ENABLE;
     -- Inputs
     datetime_dei_uxn_device_h_l621_c12_86a0_device_address <= VAR_datetime_dei_uxn_device_h_l621_c12_86a0_device_address;
     datetime_dei_uxn_device_h_l621_c12_86a0_phase <= VAR_datetime_dei_uxn_device_h_l621_c12_86a0_phase;
     datetime_dei_uxn_device_h_l621_c12_86a0_previous_device_ram_read <= VAR_datetime_dei_uxn_device_h_l621_c12_86a0_previous_device_ram_read;
     -- Outputs
     VAR_datetime_dei_uxn_device_h_l621_c12_86a0_return_output := datetime_dei_uxn_device_h_l621_c12_86a0_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l620_c7_fb20_iftrue := VAR_datetime_dei_uxn_device_h_l621_c12_86a0_return_output;
     VAR_result_MUX_uxn_device_h_l620_c7_fb20_iffalse := VAR_generic_dei_uxn_device_h_l624_c12_ead4_return_output;
     -- result_MUX[uxn_device_h_l620_c7_fb20] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l620_c7_fb20_cond <= VAR_result_MUX_uxn_device_h_l620_c7_fb20_cond;
     result_MUX_uxn_device_h_l620_c7_fb20_iftrue <= VAR_result_MUX_uxn_device_h_l620_c7_fb20_iftrue;
     result_MUX_uxn_device_h_l620_c7_fb20_iffalse <= VAR_result_MUX_uxn_device_h_l620_c7_fb20_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l620_c7_fb20_return_output := result_MUX_uxn_device_h_l620_c7_fb20_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l617_c7_2d7a_iffalse := VAR_result_MUX_uxn_device_h_l620_c7_fb20_return_output;
     -- result_MUX[uxn_device_h_l617_c7_2d7a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l617_c7_2d7a_cond <= VAR_result_MUX_uxn_device_h_l617_c7_2d7a_cond;
     result_MUX_uxn_device_h_l617_c7_2d7a_iftrue <= VAR_result_MUX_uxn_device_h_l617_c7_2d7a_iftrue;
     result_MUX_uxn_device_h_l617_c7_2d7a_iffalse <= VAR_result_MUX_uxn_device_h_l617_c7_2d7a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l617_c7_2d7a_return_output := result_MUX_uxn_device_h_l617_c7_2d7a_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l614_c7_abcf_iffalse := VAR_result_MUX_uxn_device_h_l617_c7_2d7a_return_output;
     -- result_MUX[uxn_device_h_l614_c7_abcf] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l614_c7_abcf_cond <= VAR_result_MUX_uxn_device_h_l614_c7_abcf_cond;
     result_MUX_uxn_device_h_l614_c7_abcf_iftrue <= VAR_result_MUX_uxn_device_h_l614_c7_abcf_iftrue;
     result_MUX_uxn_device_h_l614_c7_abcf_iffalse <= VAR_result_MUX_uxn_device_h_l614_c7_abcf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l614_c7_abcf_return_output := result_MUX_uxn_device_h_l614_c7_abcf_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l611_c2_8913_iffalse := VAR_result_MUX_uxn_device_h_l614_c7_abcf_return_output;
     -- result_MUX[uxn_device_h_l611_c2_8913] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l611_c2_8913_cond <= VAR_result_MUX_uxn_device_h_l611_c2_8913_cond;
     result_MUX_uxn_device_h_l611_c2_8913_iftrue <= VAR_result_MUX_uxn_device_h_l611_c2_8913_iftrue;
     result_MUX_uxn_device_h_l611_c2_8913_iffalse <= VAR_result_MUX_uxn_device_h_l611_c2_8913_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l611_c2_8913_return_output := result_MUX_uxn_device_h_l611_c2_8913_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l611_c2_8913_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l611_c2_8913_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_device <= REG_VAR_device;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     device <= REG_COMB_device;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
