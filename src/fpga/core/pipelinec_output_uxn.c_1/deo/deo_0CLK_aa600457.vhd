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
-- Submodules: 40
entity deo_0CLK_aa600457 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(11 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_aa600457;
architecture arch of deo_0CLK_aa600457 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l497_c6_9a81]
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c7_b3d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l497_c2_43a6]
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l497_c2_43a6]
signal n8_MUX_uxn_opcodes_h_l497_c2_43a6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_43a6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l497_c2_43a6]
signal t8_MUX_uxn_opcodes_h_l497_c2_43a6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_43a6_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l497_c2_43a6]
signal result_MUX_uxn_opcodes_h_l497_c2_43a6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l510_c11_48fb]
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l513_c7_738b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l510_c7_b3d1]
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l510_c7_b3d1]
signal n8_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l510_c7_b3d1]
signal t8_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l510_c7_b3d1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l510_c7_b3d1]
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l510_c7_b3d1]
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l510_c7_b3d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l510_c7_b3d1]
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l510_c7_b3d1]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l510_c7_b3d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l510_c7_b3d1]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l510_c7_b3d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l513_c11_4c1b]
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_ace2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l513_c7_738b]
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l513_c7_738b]
signal n8_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l513_c7_738b]
signal t8_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l513_c7_738b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l513_c7_738b]
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l513_c7_738b]
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l513_c7_738b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l513_c7_738b]
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l513_c7_738b]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l513_c7_738b]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l513_c7_738b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l515_c30_b488]
signal sp_relative_shift_uxn_opcodes_h_l515_c30_b488_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_b488_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_b488_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_b488_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l519_c9_487b]
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l519_c9_42e4]
signal MUX_uxn_opcodes_h_l519_c9_42e4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_42e4_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_42e4_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_42e4_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l520_c42_e128]
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_return_output : unsigned(11 downto 0);

-- device_out[uxn_opcodes_h_l520_c23_a2ea]
signal device_out_uxn_opcodes_h_l520_c23_a2ea_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_a2ea_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_a2ea_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_a2ea_phase : unsigned(11 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_a2ea_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_a2ea_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_a2ea_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4770( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_cfe0( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81
BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_left,
BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_right,
BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6
device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_cond,
device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue,
device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse,
device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output);

-- n8_MUX_uxn_opcodes_h_l497_c2_43a6
n8_MUX_uxn_opcodes_h_l497_c2_43a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l497_c2_43a6_cond,
n8_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue,
n8_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse,
n8_MUX_uxn_opcodes_h_l497_c2_43a6_return_output);

-- t8_MUX_uxn_opcodes_h_l497_c2_43a6
t8_MUX_uxn_opcodes_h_l497_c2_43a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l497_c2_43a6_cond,
t8_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue,
t8_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse,
t8_MUX_uxn_opcodes_h_l497_c2_43a6_return_output);

-- result_MUX_uxn_opcodes_h_l497_c2_43a6
result_MUX_uxn_opcodes_h_l497_c2_43a6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l497_c2_43a6_cond,
result_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue,
result_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse,
result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb
BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_left,
BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_right,
BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1
device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_cond,
device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue,
device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse,
device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output);

-- n8_MUX_uxn_opcodes_h_l510_c7_b3d1
n8_MUX_uxn_opcodes_h_l510_c7_b3d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l510_c7_b3d1_cond,
n8_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue,
n8_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse,
n8_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output);

-- t8_MUX_uxn_opcodes_h_l510_c7_b3d1
t8_MUX_uxn_opcodes_h_l510_c7_b3d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l510_c7_b3d1_cond,
t8_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue,
t8_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse,
t8_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1
result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_cond,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1
result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_cond,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b
BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_left,
BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_right,
BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l513_c7_738b
device_out_result_MUX_uxn_opcodes_h_l513_c7_738b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_cond,
device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_iftrue,
device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_iffalse,
device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_return_output);

-- n8_MUX_uxn_opcodes_h_l513_c7_738b
n8_MUX_uxn_opcodes_h_l513_c7_738b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l513_c7_738b_cond,
n8_MUX_uxn_opcodes_h_l513_c7_738b_iftrue,
n8_MUX_uxn_opcodes_h_l513_c7_738b_iffalse,
n8_MUX_uxn_opcodes_h_l513_c7_738b_return_output);

-- t8_MUX_uxn_opcodes_h_l513_c7_738b
t8_MUX_uxn_opcodes_h_l513_c7_738b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l513_c7_738b_cond,
t8_MUX_uxn_opcodes_h_l513_c7_738b_iftrue,
t8_MUX_uxn_opcodes_h_l513_c7_738b_iffalse,
t8_MUX_uxn_opcodes_h_l513_c7_738b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b
result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_cond,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b
result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_cond,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l515_c30_b488
sp_relative_shift_uxn_opcodes_h_l515_c30_b488 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l515_c30_b488_ins,
sp_relative_shift_uxn_opcodes_h_l515_c30_b488_x,
sp_relative_shift_uxn_opcodes_h_l515_c30_b488_y,
sp_relative_shift_uxn_opcodes_h_l515_c30_b488_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b
BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_left,
BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_right,
BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_return_output);

-- MUX_uxn_opcodes_h_l519_c9_42e4
MUX_uxn_opcodes_h_l519_c9_42e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l519_c9_42e4_cond,
MUX_uxn_opcodes_h_l519_c9_42e4_iftrue,
MUX_uxn_opcodes_h_l519_c9_42e4_iffalse,
MUX_uxn_opcodes_h_l519_c9_42e4_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_left,
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_right,
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_return_output);

-- device_out_uxn_opcodes_h_l520_c23_a2ea
device_out_uxn_opcodes_h_l520_c23_a2ea : entity work.device_out_0CLK_44a847cb port map (
clk,
device_out_uxn_opcodes_h_l520_c23_a2ea_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l520_c23_a2ea_device_address,
device_out_uxn_opcodes_h_l520_c23_a2ea_value,
device_out_uxn_opcodes_h_l520_c23_a2ea_phase,
device_out_uxn_opcodes_h_l520_c23_a2ea_previous_device_ram_read,
device_out_uxn_opcodes_h_l520_c23_a2ea_previous_ram_read,
device_out_uxn_opcodes_h_l520_c23_a2ea_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
 device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output,
 n8_MUX_uxn_opcodes_h_l497_c2_43a6_return_output,
 t8_MUX_uxn_opcodes_h_l497_c2_43a6_return_output,
 result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_return_output,
 device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
 n8_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
 t8_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_return_output,
 device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_return_output,
 n8_MUX_uxn_opcodes_h_l513_c7_738b_return_output,
 t8_MUX_uxn_opcodes_h_l513_c7_738b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_return_output,
 sp_relative_shift_uxn_opcodes_h_l515_c30_b488_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_return_output,
 MUX_uxn_opcodes_h_l519_c9_42e4_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_return_output,
 device_out_uxn_opcodes_h_l520_c23_a2ea_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_43a6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_43a6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_43a6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_43a6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_43a6_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_cfe0_uxn_opcodes_h_l497_c2_43a6_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_43a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_2ffd : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_e7e2 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_531e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_b3d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_a02d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b488_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b488_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b488_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b488_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_42e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_42e4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_42e4_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_42e4_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_phase : unsigned(11 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_return_output : unsigned(11 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_d0be_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_a534_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_fc7c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_06dd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_2bab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_9f96_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_0db6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_f2c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_587b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6a53_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_d5ae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_341b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6f71_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_99a8_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_531e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_531e;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_2ffd := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_e7e2 := resize(to_unsigned(1, 1), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b488_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_a02d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_a02d;
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b488_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_right := to_unsigned(3, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b488_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l519_c9_42e4_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_738b_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l519_c9_42e4_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_738b_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_738b_iffalse := t8;
     -- result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_b3d1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l510_c11_48fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6a53 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6a53_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_99a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_99a8_return_output := result.is_device_ram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_b3d1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6f71 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6f71_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_d5ae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_d5ae_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_587b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_587b_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_f2c3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_f2c3_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_341b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_341b_return_output := result.u8_value;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l497_c2_43a6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_43a6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_2ffd,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_e7e2,
     to_unsigned(0, 1));

     -- BIN_OP_MINUS[uxn_opcodes_h_l520_c42_e128] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_left;
     BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_return_output := BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l519_c9_487b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_left;
     BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_return_output := BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l497_c6_9a81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_left;
     BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_return_output := BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l515_c30_b488] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l515_c30_b488_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b488_ins;
     sp_relative_shift_uxn_opcodes_h_l515_c30_b488_x <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b488_x;
     sp_relative_shift_uxn_opcodes_h_l515_c30_b488_y <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b488_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b488_return_output := sp_relative_shift_uxn_opcodes_h_l515_c30_b488_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l513_c11_4c1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_43a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_return_output;
     VAR_result_MUX_uxn_opcodes_h_l497_c2_43a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_43a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_9a81_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_b3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_48fb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_738b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_738b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_4c1b_return_output;
     VAR_MUX_uxn_opcodes_h_l519_c9_42e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_487b_return_output;
     VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_e128_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_587b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_587b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_99a8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_99a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_d5ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_d5ae_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_f2c3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_f2c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6f71_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6f71_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6a53_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6a53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_341b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_341b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_43a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue := VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_b3d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_b3d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b488_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l513_c7_738b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_return_output;

     -- t8_MUX[uxn_opcodes_h_l513_c7_738b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l513_c7_738b_cond <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_738b_cond;
     t8_MUX_uxn_opcodes_h_l513_c7_738b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_738b_iftrue;
     t8_MUX_uxn_opcodes_h_l513_c7_738b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_738b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_738b_return_output := t8_MUX_uxn_opcodes_h_l513_c7_738b_return_output;

     -- MUX[uxn_opcodes_h_l519_c9_42e4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l519_c9_42e4_cond <= VAR_MUX_uxn_opcodes_h_l519_c9_42e4_cond;
     MUX_uxn_opcodes_h_l519_c9_42e4_iftrue <= VAR_MUX_uxn_opcodes_h_l519_c9_42e4_iftrue;
     MUX_uxn_opcodes_h_l519_c9_42e4_iffalse <= VAR_MUX_uxn_opcodes_h_l519_c9_42e4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l519_c9_42e4_return_output := MUX_uxn_opcodes_h_l519_c9_42e4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;
     VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_value := VAR_MUX_uxn_opcodes_h_l519_c9_42e4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_738b_iffalse := VAR_MUX_uxn_opcodes_h_l519_c9_42e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_738b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l513_c7_738b_return_output;
     -- t8_MUX[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l510_c7_b3d1_cond <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_b3d1_cond;
     t8_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue;
     t8_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output := t8_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;

     -- n8_MUX[uxn_opcodes_h_l513_c7_738b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l513_c7_738b_cond <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_738b_cond;
     n8_MUX_uxn_opcodes_h_l513_c7_738b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_738b_iftrue;
     n8_MUX_uxn_opcodes_h_l513_c7_738b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_738b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_738b_return_output := n8_MUX_uxn_opcodes_h_l513_c7_738b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l513_c7_738b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_738b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l513_c7_738b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_ace2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_return_output;

     -- t8_MUX[uxn_opcodes_h_l497_c2_43a6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l497_c2_43a6_cond <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_43a6_cond;
     t8_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue;
     t8_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_43a6_return_output := t8_MUX_uxn_opcodes_h_l497_c2_43a6_return_output;

     -- n8_MUX[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l510_c7_b3d1_cond <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_b3d1_cond;
     n8_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue;
     n8_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output := n8_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_ace2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l497_c2_43a6_return_output;
     -- n8_MUX[uxn_opcodes_h_l497_c2_43a6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l497_c2_43a6_cond <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_43a6_cond;
     n8_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue;
     n8_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_43a6_return_output := n8_MUX_uxn_opcodes_h_l497_c2_43a6_return_output;

     -- device_out[uxn_opcodes_h_l520_c23_a2ea] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l520_c23_a2ea_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l520_c23_a2ea_device_address <= VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_device_address;
     device_out_uxn_opcodes_h_l520_c23_a2ea_value <= VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_value;
     device_out_uxn_opcodes_h_l520_c23_a2ea_phase <= VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_phase;
     device_out_uxn_opcodes_h_l520_c23_a2ea_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_previous_device_ram_read;
     device_out_uxn_opcodes_h_l520_c23_a2ea_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_return_output := device_out_uxn_opcodes_h_l520_c23_a2ea_return_output;

     -- Submodule level 5
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_iffalse := VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l497_c2_43a6_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l522_c31_a534] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_a534_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l521_c32_d0be] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_d0be_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l523_c21_fc7c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_fc7c_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_return_output.u8_value;

     -- device_out_result_MUX[uxn_opcodes_h_l513_c7_738b] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_cond;
     device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_return_output := device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l526_c29_9f96] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_9f96_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l525_c26_2bab] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_2bab_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l527_c24_0db6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_0db6_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_return_output.is_deo_done;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l524_c22_06dd] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_06dd_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_a2ea_return_output.u16_addr;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_06dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_0db6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_d0be_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_2bab_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_9f96_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_a534_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_fc7c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_738b_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_cond;
     device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output := device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l513_c7_738b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l513_c7_738b] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l513_c7_738b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_return_output := result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l513_c7_738b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l513_c7_738b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_return_output := result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l513_c7_738b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l513_c7_738b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_738b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_738b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_738b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_738b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_738b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_738b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_738b_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output := result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l497_c2_43a6] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_cond;
     device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output := device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l510_c7_b3d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output := result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output;

     -- Submodule level 8
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_cfe0[uxn_opcodes_h_l497_c2_43a6] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_cfe0_uxn_opcodes_h_l497_c2_43a6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cfe0(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_b3d1_return_output);

     -- Submodule level 9
     VAR_result_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_cfe0_uxn_opcodes_h_l497_c2_43a6_return_output;
     -- result_MUX[uxn_opcodes_h_l497_c2_43a6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l497_c2_43a6_cond <= VAR_result_MUX_uxn_opcodes_h_l497_c2_43a6_cond;
     result_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l497_c2_43a6_iftrue;
     result_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l497_c2_43a6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output := result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l497_c2_43a6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
