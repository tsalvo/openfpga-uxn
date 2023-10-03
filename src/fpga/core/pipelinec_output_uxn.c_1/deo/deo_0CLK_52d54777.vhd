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
-- Submodules: 90
entity deo_0CLK_52d54777 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_52d54777;
architecture arch of deo_0CLK_52d54777 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l407_c6_1046]
signal BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l407_c1_3e77]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l413_c7_98c9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l407_c2_ca42]
signal t8_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l407_c2_ca42]
signal n8_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l407_c2_ca42]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l407_c2_ca42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l407_c2_ca42]
signal result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l407_c2_ca42]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l407_c2_ca42]
signal result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(1 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l407_c2_ca42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l407_c2_ca42]
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l407_c2_ca42]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l407_c2_ca42]
signal result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(31 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l407_c2_ca42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l407_c2_ca42]
signal result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l407_c2_ca42]
signal result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l407_c2_ca42]
signal device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : device_out_result_t;

-- printf_uxn_opcodes_h_l408_c3_baf2[uxn_opcodes_h_l408_c3_baf2]
signal printf_uxn_opcodes_h_l408_c3_baf2_uxn_opcodes_h_l408_c3_baf2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l413_c11_4a81]
signal BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l416_c7_452b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l413_c7_98c9]
signal t8_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l413_c7_98c9]
signal n8_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l413_c7_98c9]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l413_c7_98c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l413_c7_98c9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l413_c7_98c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l413_c7_98c9]
signal result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(1 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l413_c7_98c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l413_c7_98c9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l413_c7_98c9]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l413_c7_98c9]
signal result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(31 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l413_c7_98c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l413_c7_98c9]
signal result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l413_c7_98c9]
signal result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l413_c7_98c9]
signal device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l416_c11_2ec4]
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l420_c7_a52e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l416_c7_452b]
signal t8_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l416_c7_452b]
signal n8_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l416_c7_452b]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l416_c7_452b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l416_c7_452b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l416_c7_452b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l416_c7_452b]
signal result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(1 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l416_c7_452b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l416_c7_452b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l416_c7_452b]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l416_c7_452b]
signal result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(31 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l416_c7_452b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l416_c7_452b]
signal result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l416_c7_452b]
signal result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l416_c7_452b]
signal device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l420_c11_a5f3]
signal BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c7_8f44]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l420_c7_a52e]
signal n8_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l420_c7_a52e]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l420_c7_a52e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l420_c7_a52e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l420_c7_a52e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l420_c7_a52e]
signal result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(1 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l420_c7_a52e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l420_c7_a52e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l420_c7_a52e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l420_c7_a52e]
signal result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(31 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l420_c7_a52e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l420_c7_a52e]
signal result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l420_c7_a52e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l420_c7_a52e]
signal device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l423_c11_49c7]
signal BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l429_c1_0cb9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l423_c7_8f44]
signal n8_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l423_c7_8f44]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l423_c7_8f44]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : signed(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l423_c7_8f44]
signal result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l423_c7_8f44]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l423_c7_8f44]
signal result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(1 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l423_c7_8f44]
signal result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l423_c7_8f44]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l423_c7_8f44]
signal result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(31 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l423_c7_8f44]
signal result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l423_c7_8f44]
signal result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l423_c7_8f44]
signal result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l423_c7_8f44]
signal device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l427_c32_a555]
signal BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l427_c32_c612]
signal BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l427_c32_2f49]
signal MUX_uxn_opcodes_h_l427_c32_2f49_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l427_c32_2f49_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l427_c32_2f49_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l427_c32_2f49_return_output : signed(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l431_c42_e7c2]
signal BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l431_c23_89d8]
signal device_out_uxn_opcodes_h_l431_c23_89d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l431_c23_89d8_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l431_c23_89d8_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l431_c23_89d8_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l431_c23_89d8_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l431_c23_89d8_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d102( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.vram_value := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;
      base.vram_address := ref_toks_9;
      base.is_opc_done := ref_toks_10;
      base.device_ram_value := ref_toks_11;
      base.device_ram_address := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046
BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_left,
BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_right,
BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- t8_MUX_uxn_opcodes_h_l407_c2_ca42
t8_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
t8_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
t8_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
t8_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- n8_MUX_uxn_opcodes_h_l407_c2_ca42
n8_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
n8_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
n8_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
n8_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42
result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42
result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42
result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42
result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42
result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42
result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42
result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42
result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42
result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42
device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_cond,
device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue,
device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse,
device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

-- printf_uxn_opcodes_h_l408_c3_baf2_uxn_opcodes_h_l408_c3_baf2
printf_uxn_opcodes_h_l408_c3_baf2_uxn_opcodes_h_l408_c3_baf2 : entity work.printf_uxn_opcodes_h_l408_c3_baf2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l408_c3_baf2_uxn_opcodes_h_l408_c3_baf2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81
BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_left,
BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_right,
BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- t8_MUX_uxn_opcodes_h_l413_c7_98c9
t8_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
t8_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
t8_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
t8_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- n8_MUX_uxn_opcodes_h_l413_c7_98c9
n8_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
n8_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
n8_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
n8_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9
result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9
result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9
result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9
result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9
result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9
result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9
result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9
result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9
result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9
result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9
device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_cond,
device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue,
device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse,
device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4
BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_left,
BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_right,
BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- t8_MUX_uxn_opcodes_h_l416_c7_452b
t8_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l416_c7_452b_cond,
t8_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
t8_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
t8_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- n8_MUX_uxn_opcodes_h_l416_c7_452b
n8_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l416_c7_452b_cond,
n8_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
n8_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
n8_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b
result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b
result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b
result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b
result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_cond,
result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b
result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b
result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b
result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_cond,
result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b
result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b
result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l416_c7_452b
device_out_result_MUX_uxn_opcodes_h_l416_c7_452b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_cond,
device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_iftrue,
device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_iffalse,
device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3
BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_left,
BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_right,
BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_return_output);

-- n8_MUX_uxn_opcodes_h_l420_c7_a52e
n8_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
n8_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
n8_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
n8_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e
result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e
result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e
result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e
result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e
result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e
result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e
result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e
result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e
result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e
result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e
result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e
device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_cond,
device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7
BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_left,
BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_right,
BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_return_output);

-- n8_MUX_uxn_opcodes_h_l423_c7_8f44
n8_MUX_uxn_opcodes_h_l423_c7_8f44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l423_c7_8f44_cond,
n8_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue,
n8_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse,
n8_MUX_uxn_opcodes_h_l423_c7_8f44_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44
result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44
result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44
result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44
result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44
result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_cond,
result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44
result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44
result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44
result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_cond,
result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44
result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44
result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44
result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44
device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_cond,
device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue,
device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse,
device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l427_c32_a555
BIN_OP_AND_uxn_opcodes_h_l427_c32_a555 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_left,
BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_right,
BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l427_c32_c612
BIN_OP_GT_uxn_opcodes_h_l427_c32_c612 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_left,
BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_right,
BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_return_output);

-- MUX_uxn_opcodes_h_l427_c32_2f49
MUX_uxn_opcodes_h_l427_c32_2f49 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l427_c32_2f49_cond,
MUX_uxn_opcodes_h_l427_c32_2f49_iftrue,
MUX_uxn_opcodes_h_l427_c32_2f49_iffalse,
MUX_uxn_opcodes_h_l427_c32_2f49_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2
BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_left,
BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_right,
BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_return_output);

-- device_out_uxn_opcodes_h_l431_c23_89d8
device_out_uxn_opcodes_h_l431_c23_89d8 : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l431_c23_89d8_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l431_c23_89d8_device_address,
device_out_uxn_opcodes_h_l431_c23_89d8_value,
device_out_uxn_opcodes_h_l431_c23_89d8_phase,
device_out_uxn_opcodes_h_l431_c23_89d8_previous_device_ram_read,
device_out_uxn_opcodes_h_l431_c23_89d8_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 t8_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 n8_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 t8_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 n8_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 t8_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 n8_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_return_output,
 n8_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_return_output,
 n8_MUX_uxn_opcodes_h_l423_c7_8f44_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_return_output,
 device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_return_output,
 BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_return_output,
 BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_return_output,
 MUX_uxn_opcodes_h_l427_c32_2f49_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_return_output,
 device_out_uxn_opcodes_h_l431_c23_89d8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l410_c3_5a96 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l408_c3_baf2_uxn_opcodes_h_l408_c3_baf2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l414_c3_d098 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l418_c3_2803 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l421_c3_a286 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l420_c7_a52e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l427_c32_2f49_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l427_c32_2f49_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l427_c32_2f49_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l427_c32_2f49_return_output : signed(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l431_c23_89d8_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l431_c23_89d8_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l431_c23_89d8_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l431_c23_89d8_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l431_c23_89d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l431_c23_89d8_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l432_c32_bad1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l433_c31_9094_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l434_c31_b606_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l435_c29_6ab2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l436_c26_c5db_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l437_c25_67b8_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l438_c23_13ac_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l439_c24_61c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_075c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_2060_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l420_l413_l416_DUPLICATE_342f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ae52_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac93_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_b672_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_fe5b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_9b71_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l420_l423_l413_l416_DUPLICATE_8c5a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l420_l423_l413_l416_DUPLICATE_c482_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d102_uxn_opcodes_h_l442_l402_DUPLICATE_0729_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l414_c3_d098 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l414_c3_d098;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l410_c3_5a96 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l410_c3_5a96;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l418_c3_2803 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l418_c3_2803;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l427_c32_2f49_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l427_c32_2f49_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l421_c3_a286 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l421_c3_a286;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_left := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l431_c23_89d8_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l431_c23_89d8_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l431_c23_89d8_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l423_c11_49c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_9b71 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_9b71_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l407_c6_1046] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_left;
     BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output := BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_b672 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_b672_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l413_c11_4a81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_left;
     BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output := BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac3c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac3c_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_fe5b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_fe5b_return_output := result.device_ram_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l420_c7_a52e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l427_c32_a555] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_left;
     BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_return_output := BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_return_output;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ae52 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ae52_return_output := result.vram_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_075c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_075c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_2060 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_2060_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac93 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac93_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l420_l413_l416_DUPLICATE_342f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l420_l413_l416_DUPLICATE_342f_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l420_c11_a5f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l420_l423_l413_l416_DUPLICATE_c482 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l420_l423_l413_l416_DUPLICATE_c482_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l420_l423_l413_l416_DUPLICATE_8c5a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l420_l423_l413_l416_DUPLICATE_8c5a_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l416_c11_2ec4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_left;
     BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output := BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l431_c42_e7c2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_left;
     BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_return_output := BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_left := VAR_BIN_OP_AND_uxn_opcodes_h_l427_c32_a555_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l407_c2_ca42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l407_c6_1046_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l413_c7_98c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l413_c11_4a81_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l416_c7_452b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_2ec4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_a5f3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l423_c7_8f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l423_c11_49c7_return_output;
     VAR_device_out_uxn_opcodes_h_l431_c23_89d8_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l431_c42_e7c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_075c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_075c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_075c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_075c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_075c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac3c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac3c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac3c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac3c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac3c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac93_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac93_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac93_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac93_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ac93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l420_l423_l413_l416_DUPLICATE_c482_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l420_l423_l413_l416_DUPLICATE_c482_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l420_l423_l413_l416_DUPLICATE_c482_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l420_l423_l413_l416_DUPLICATE_c482_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l420_l413_l416_DUPLICATE_342f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l420_l413_l416_DUPLICATE_342f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l420_l413_l416_DUPLICATE_342f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l407_l420_l413_l416_DUPLICATE_342f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l420_l423_l413_l416_DUPLICATE_8c5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l420_l423_l413_l416_DUPLICATE_8c5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l420_l423_l413_l416_DUPLICATE_8c5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l420_l423_l413_l416_DUPLICATE_8c5a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_2060_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_2060_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_2060_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_2060_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_2060_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ae52_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ae52_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ae52_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ae52_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_ae52_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_b672_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_b672_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_b672_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_b672_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_b672_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_9b71_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_9b71_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_9b71_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_9b71_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_9b71_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_fe5b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_fe5b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_fe5b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_fe5b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l420_l423_l416_l413_l407_DUPLICATE_fe5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l420_c7_a52e_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l427_c32_c612] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_left;
     BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_return_output := BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l423_c7_8f44] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;

     -- n8_MUX[uxn_opcodes_h_l423_c7_8f44] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l423_c7_8f44_cond <= VAR_n8_MUX_uxn_opcodes_h_l423_c7_8f44_cond;
     n8_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue;
     n8_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l423_c7_8f44_return_output := n8_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l423_c7_8f44] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- t8_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_t8_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     t8_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     t8_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l416_c7_452b_return_output := t8_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l407_c1_3e77] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l427_c32_2f49_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l427_c32_c612_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     VAR_printf_uxn_opcodes_h_l408_c3_baf2_uxn_opcodes_h_l408_c3_baf2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l407_c1_3e77_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- MUX[uxn_opcodes_h_l427_c32_2f49] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l427_c32_2f49_cond <= VAR_MUX_uxn_opcodes_h_l427_c32_2f49_cond;
     MUX_uxn_opcodes_h_l427_c32_2f49_iftrue <= VAR_MUX_uxn_opcodes_h_l427_c32_2f49_iftrue;
     MUX_uxn_opcodes_h_l427_c32_2f49_iffalse <= VAR_MUX_uxn_opcodes_h_l427_c32_2f49_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l427_c32_2f49_return_output := MUX_uxn_opcodes_h_l427_c32_2f49_return_output;

     -- printf_uxn_opcodes_h_l408_c3_baf2[uxn_opcodes_h_l408_c3_baf2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l408_c3_baf2_uxn_opcodes_h_l408_c3_baf2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l408_c3_baf2_uxn_opcodes_h_l408_c3_baf2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- t8_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_t8_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     t8_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     t8_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := t8_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- n8_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_n8_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     n8_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     n8_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := n8_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue := VAR_MUX_uxn_opcodes_h_l427_c32_2f49_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_t8_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l423_c7_8f44] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- t8_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_t8_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     t8_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     t8_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := t8_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- n8_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_n8_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     n8_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     n8_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l416_c7_452b_return_output := n8_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- n8_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_n8_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     n8_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     n8_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := n8_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c7_8f44] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_n8_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l429_c1_0cb9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_return_output;

     -- n8_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_n8_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     n8_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     n8_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := n8_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l431_c23_89d8_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l429_c1_0cb9_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- device_out[uxn_opcodes_h_l431_c23_89d8] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l431_c23_89d8_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l431_c23_89d8_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l431_c23_89d8_device_address <= VAR_device_out_uxn_opcodes_h_l431_c23_89d8_device_address;
     device_out_uxn_opcodes_h_l431_c23_89d8_value <= VAR_device_out_uxn_opcodes_h_l431_c23_89d8_value;
     device_out_uxn_opcodes_h_l431_c23_89d8_phase <= VAR_device_out_uxn_opcodes_h_l431_c23_89d8_phase;
     device_out_uxn_opcodes_h_l431_c23_89d8_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l431_c23_89d8_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l431_c23_89d8_return_output := device_out_uxn_opcodes_h_l431_c23_89d8_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse := VAR_device_out_uxn_opcodes_h_l431_c23_89d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l438_c23_13ac] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l438_c23_13ac_return_output := VAR_device_out_uxn_opcodes_h_l431_c23_89d8_return_output.vram_value;

     -- device_out_result_MUX[uxn_opcodes_h_l423_c7_8f44] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_cond;
     device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_return_output := device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l432_c32_bad1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l432_c32_bad1_return_output := VAR_device_out_uxn_opcodes_h_l431_c23_89d8_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l434_c31_b606] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l434_c31_b606_return_output := VAR_device_out_uxn_opcodes_h_l431_c23_89d8_return_output.device_ram_address;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l436_c26_c5db] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l436_c26_c5db_return_output := VAR_device_out_uxn_opcodes_h_l431_c23_89d8_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l433_c31_9094] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l433_c31_9094_return_output := VAR_device_out_uxn_opcodes_h_l431_c23_89d8_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l435_c29_6ab2] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l435_c29_6ab2_return_output := VAR_device_out_uxn_opcodes_h_l431_c23_89d8_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l439_c24_61c7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l439_c24_61c7_return_output := VAR_device_out_uxn_opcodes_h_l431_c23_89d8_return_output.is_deo_done;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l437_c25_67b8] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l437_c25_67b8_return_output := VAR_device_out_uxn_opcodes_h_l431_c23_89d8_return_output.vram_address;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l439_c24_61c7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l433_c31_9094_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l432_c32_bad1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l436_c26_c5db_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l438_c23_13ac_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l437_c25_67b8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l434_c31_b606_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l435_c29_6ab2_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l423_c7_8f44] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l423_c7_8f44] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l423_c7_8f44] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l423_c7_8f44] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l423_c7_8f44] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_cond;
     result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_return_output := result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l423_c7_8f44] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l423_c7_8f44] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l423_c7_8f44] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_cond;
     result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_return_output := result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l423_c7_8f44_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l420_c7_a52e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_return_output := device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l420_c7_a52e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_return_output := result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l416_c7_452b] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_cond;
     result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_return_output := result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l416_c7_452b_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l413_c7_98c9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l413_c7_98c9_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l407_c2_ca42] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d102_uxn_opcodes_h_l442_l402_DUPLICATE_0729 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d102_uxn_opcodes_h_l442_l402_DUPLICATE_0729_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d102(
     result,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l407_c2_ca42_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l407_c2_ca42_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d102_uxn_opcodes_h_l442_l402_DUPLICATE_0729_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d102_uxn_opcodes_h_l442_l402_DUPLICATE_0729_return_output;
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
